/*******************************************************************************
 *
 *  LHEPythia.cpp, Version: 1.2
 *
 *  Copyright (C) 2020, GPL v3 License
 *
 *  Author  :   KANG, Jin-Wen
 *  E-Mail  :   kangjinwen@vip.qq.com
 *  Date    :   2020-09-05 14:21 +0800
 *  Description :   读取外部 LHEF-style 文件来运行，并保存为 HepMC2 文件。
 *  Refs    :   Pythia8/examples/main31.cc && main41.cc
 *
 *  ChangeLogs :
 *      2020-09-05 14:21 +0800  :   创建
 *      2020-09-19 11:37 +0800  :   1. 添加命令行参数处理.
 *      2020-10-13 22:01 +0800  :   1. 添加命令行选项用于设置随机数种子;
 *                                  2. 并将传入的随机数种子为 Pythia8 设置.
 *
 * ****************************************************************************/

#include "Pythia8/Pythia.h"
#include "Pythia8Plugins/HepMC2.h"
#include "Pythia8Plugins/PowhegHooks.h"
#include "cmdline/cmdline.h"

using namespace Pythia8;

int main(int argc, char *argv[])
{
    // 命令行参数解析
    cmdline::parser args;
    args.add<string>("config", 'c', "Configuration file", false,
                     "./LHEPythia.cmnd");
    args.add<int>("seed", 's',
                  "Set the seed (default = -1; Max = 900,000,000; Based "
                  "on the time: 0",
                  false, -1);
    args.add<string>("input-lhe", 'i', "Input LHE file", false);
    args.add<string>("output", 'o', "Output filename", true);
    args.add("help", 'h', "Print help message");
    
    args.set_program_name("lhepythia");

    bool isGetArgs = args.parse(argc, argv);

    if (argc == 1 || args.exist("help"))
    {
        cerr << args.usage();
        exit(EXIT_FAILURE);
    }

    if (!isGetArgs)
    {
        cerr << args.error() << endl << args.usage();
        exit(EXIT_FAILURE);
    }
    //***********************************************************************

    // Interface for conversion from Pythia8::Event to HepMC event.
    HepMC::Pythia8ToHepMC ToHepMC;
    // Specify file where HepMC events will be stored.
    HepMC::IO_GenEvent ascii_io(args.get<string>("output"), std::ios::out);

    Pythia pythia;

    // Load configuration file
    pythia.readFile(args.get<string>("config"));

    // 若指定输入的 LHEF 文件，则覆盖配置文件中的设置
    if (args.exist("input-lhe"))
    {
        pythia.settings.readString("Beams:LHEF = " + args.get<string>("input-lhe"));
    }

    // 若指定随机数生成种子，则设定之
    if (args.exist("seed"))
    {
        pythia.settings.readString("Random:setSeed = on");
        pythia.settings.readString("Random:seed = " +
                                   std::to_string(args.get<int>("seed")));
    }

    // Read in main settings
    int nEvent = pythia.settings.mode("Main:numberOfEvents");
    int nError = pythia.settings.mode("Main:timesAllowErrors");
    // Read in key POWHEG merging settings
    int vetoMode = pythia.settings.mode("POWHEG:veto");
    int MPIvetoMode = pythia.settings.mode("POWHEG:MPIveto");
    bool loadHooks = (vetoMode > 0 || MPIvetoMode > 0);

    // Add in user hooks for shower vetoing
    PowhegHooks *powhegHooks = NULL;
    if (loadHooks)
    {

        // Set ISR and FSR to start at the kinematical limit
        if (vetoMode > 0)
        {
            pythia.readString("SpaceShower:pTmaxMatch = 2");
            pythia.readString("TimeShower:pTmaxMatch = 2");
        }

        // Set MPI to start at the kinematical limit
        if (MPIvetoMode > 0)
        {
            pythia.readString("MultipartonInteractions:pTmaxMatch = 2");
        }

        powhegHooks = new PowhegHooks();
        pythia.setUserHooksPtr((UserHooks *)powhegHooks);
    }

    // Initialise and list settings
    pythia.init();

    // Counters for number of ISR/FSR emissions vetoed
    unsigned long int nISRveto = 0, nFSRveto = 0;

    // Begin event loop; generate until nEvent events are processed
    // or end of LHEF file
    int iEvent = 0, iError = 0;
    while (true)
    {

        // Generate the next event
        if (!pythia.next())
        {

            // If failure because reached end of file then exit event loop
            if (pythia.info.atEndOfFile())
                break;

            // Otherwise count event failure and continue/exit as necessary
            cout << "Warning: event " << iEvent << " failed" << endl;
            if (++iError == nError)
            {
                cout << "Error: too many event failures.. exiting" << endl;
                break;
            }

            continue;
        }

        /*
         * Process dependent checks and analysis may be inserted here
         */

        // Update ISR/FSR veto counters
        if (loadHooks)
        {
            nISRveto += powhegHooks->getNISRveto();
            nFSRveto += powhegHooks->getNFSRveto();
        }

        // Construct new empty HepMC event and fill it.
        // Units will be as chosen for HepMC build; but can be changed
        // by arguments, e.g. GenEvt( HepMC::Units::GEV, HepMC::Units::MM)
        HepMC::GenEvent *hepmcevt = new HepMC::GenEvent();
        ToHepMC.fill_next_event(pythia, hepmcevt);

        // Write the HepMC event to file. Done with it.
        ascii_io << hepmcevt;
        delete hepmcevt;

        // If nEvent is set, check and exit loop if necessary
        ++iEvent;
        if (nEvent != 0 && iEvent == nEvent)
            break;

    } // End of event loop.

    // Statistics, histograms and veto information
    pythia.stat();
    cout << "Number of ISR emissions vetoed: " << nISRveto << endl;
    cout << "Number of FSR emissions vetoed: " << nFSRveto << endl;
    cout << endl;

    // Done.
    if (powhegHooks)
        delete powhegHooks;

    // End of run.
    pythia.stat();
    return 0;
}