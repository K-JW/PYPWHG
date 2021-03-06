      subroutine tttxxx(tt,ta,tb,gt,vertex)
c
c This subroutine computes an amplitude of the three-point coupling of
c two gauge bosons and a tensor boson.
c
c input:
c       complex ta(18)          : first  tensor                           ta
c       complex tb(18)          : second tensor                       tb
c       complex tt(18)           : input  tensor                         tt
c       complex gt             : coupling constant         gtv=-1/Lambda
c output:
c       complex vertex         : amplitude                gamma(tt,ta,tb)
c
      implicit none
      double complex ta(18), tb(18), tt(18), gt, vertex
      double complex T1(6,4),T2(6,4),T(6,4)

      integer i, j

      double complex cZero
      double precision rZero, rTwo
      parameter( rZero = 0.0d0, rTwo = 2.0d0 )
      parameter( cZero = ( 0.0d0, 0.0d0 ) )

      
      T(1,1) = tt(1)
      T(1,2) = tt(2)
      T(1,3) = tt(3)
      T(1,4) = tt(4)
      T(2,1) = tt(5)
      T(2,2) = tt(6)
      T(2,3) = tt(7)
      T(2,4) = tt(8)
      T(3,1) = tt(9)
      T(3,2) = tt(10)
      T(3,3) = tt(11)
      T(3,4) = tt(12)
      T(4,1) = tt(13)
      T(4,2) = tt(14)
      T(4,3) = tt(15)
      T(4,4) = tt(16)
      T(5,1) = tt(17)
      T(6,1) = tt(18)
 
      T1(1,1) = ta(1)
      T1(1,2) = ta(2)
      T1(1,3) = ta(3)
      T1(1,4) = ta(4)
      T1(2,1) = ta(5)
      T1(2,2) = ta(6)
      T1(2,3) = ta(7)
      T1(2,4) = ta(8)
      T1(3,1) = ta(9)
      T1(3,2) = ta(10)
      T1(3,3) = ta(11)
      T1(3,4) = ta(12)
      T1(4,1) = ta(13)
      T1(4,2) = ta(14)
      T1(4,3) = ta(15)
      T1(4,4) = ta(16)
      T1(5,1) = ta(17)
      T1(6,1) = ta(18)

      T2(1,1) = tb(1)
      T2(1,2) = tb(2)
      T2(1,3) = tb(3)
      T2(1,4) = tb(4)
      T2(2,1) = tb(5)
      T2(2,2) = tb(6)
      T2(2,3) = tb(7)
      T2(2,4) = tb(8)
      T2(3,1) = tb(9)
      T2(3,2) = tb(10)
      T2(3,3) = tb(11)
      T2(3,4) = tb(12)
      T2(4,1) = tb(13)
      T2(4,2) = tb(14)
      T2(4,3) = tb(15)
      T2(4,4) = tb(16)
      T2(5,1) = tb(17)
      T2(6,1) = tb(18)


      vertex =-gt*(T(1,1)*T1(1,2)*T2(1,2) - T(2,2)*T1(1,2)*T2(1,2) + 
     -  T(3,3)*T1(1,2)*T2(1,2) + T(4,4)*T1(1,2)*T2(1,2) - 
     -  T(2,3)*T1(1,3)*T2(1,2) - T(3,2)*T1(1,3)*T2(1,2) - 
     -  T(2,4)*T1(1,4)*T2(1,2) - T(4,2)*T1(1,4)*T2(1,2) - 
     -  T(1,1)*T1(2,1)*T2(1,2) + T(2,2)*T1(2,1)*T2(1,2) - 
     -  T(3,3)*T1(2,1)*T2(1,2) - T(4,4)*T1(2,1)*T2(1,2) + 
     -  T(1,3)*T1(2,3)*T2(1,2) + T(3,1)*T1(2,3)*T2(1,2) + 
     -  T(1,4)*T1(2,4)*T2(1,2) + T(4,1)*T1(2,4)*T2(1,2) + 
     -  T(2,3)*T1(3,1)*T2(1,2) + T(3,2)*T1(3,1)*T2(1,2) - 
     -  T(1,3)*T1(3,2)*T2(1,2) - T(3,1)*T1(3,2)*T2(1,2) + 
     -  T(2,4)*T1(4,1)*T2(1,2) + T(4,2)*T1(4,1)*T2(1,2) - 
     -  T(1,4)*T1(4,2)*T2(1,2) - T(4,1)*T1(4,2)*T2(1,2) - 
     -  T(2,3)*T1(1,2)*T2(1,3) - T(3,2)*T1(1,2)*T2(1,3) + 
     -  T(1,1)*T1(1,3)*T2(1,3) + T(2,2)*T1(1,3)*T2(1,3) - 
     -  T(3,3)*T1(1,3)*T2(1,3) + T(4,4)*T1(1,3)*T2(1,3) - 
     -  T(3,4)*T1(1,4)*T2(1,3) - T(4,3)*T1(1,4)*T2(1,3) + 
     -  T(2,3)*T1(2,1)*T2(1,3) + T(3,2)*T1(2,1)*T2(1,3) - 
     -  T(1,2)*T1(2,3)*T2(1,3) - T(2,1)*T1(2,3)*T2(1,3) - 
     -  T(1,1)*T1(3,1)*T2(1,3) - T(2,2)*T1(3,1)*T2(1,3) + 
     -  T(3,3)*T1(3,1)*T2(1,3) - T(4,4)*T1(3,1)*T2(1,3) + 
     -  T(1,2)*T1(3,2)*T2(1,3) + T(2,1)*T1(3,2)*T2(1,3) + 
     -  T(1,4)*T1(3,4)*T2(1,3) + T(4,1)*T1(3,4)*T2(1,3) + 
     -  T(3,4)*T1(4,1)*T2(1,3) + T(4,3)*T1(4,1)*T2(1,3) - 
     -  T(1,4)*T1(4,3)*T2(1,3) - T(4,1)*T1(4,3)*T2(1,3) - 
     -  T(2,4)*T1(1,2)*T2(1,4) - T(4,2)*T1(1,2)*T2(1,4) - 
     -  T(3,4)*T1(1,3)*T2(1,4) - T(4,3)*T1(1,3)*T2(1,4) + 
     -  T(1,1)*T1(1,4)*T2(1,4) + T(2,2)*T1(1,4)*T2(1,4) + 
     -  T(3,3)*T1(1,4)*T2(1,4) - T(4,4)*T1(1,4)*T2(1,4) + 
     -  T(2,4)*T1(2,1)*T2(1,4) + T(4,2)*T1(2,1)*T2(1,4) - 
     -  T(1,2)*T1(2,4)*T2(1,4) - T(2,1)*T1(2,4)*T2(1,4) + 
     -  T(3,4)*T1(3,1)*T2(1,4) + T(4,3)*T1(3,1)*T2(1,4) - 
     -  T(1,3)*T1(3,4)*T2(1,4) - T(3,1)*T1(3,4)*T2(1,4) - 
     -  T(1,1)*T1(4,1)*T2(1,4) - T(2,2)*T1(4,1)*T2(1,4) - 
     -  T(3,3)*T1(4,1)*T2(1,4) + T(4,4)*T1(4,1)*T2(1,4) + 
     -  T(1,2)*T1(4,2)*T2(1,4) + T(2,1)*T1(4,2)*T2(1,4) + 
     -  T(1,3)*T1(4,3)*T2(1,4) + T(3,1)*T1(4,3)*T2(1,4) - 
     -  T(1,1)*T1(1,2)*T2(2,1) + T(2,2)*T1(1,2)*T2(2,1) - 
     -  T(3,3)*T1(1,2)*T2(2,1) - T(4,4)*T1(1,2)*T2(2,1) + 
     -  T(2,3)*T1(1,3)*T2(2,1) + T(3,2)*T1(1,3)*T2(2,1) + 
     -  T(2,4)*T1(1,4)*T2(2,1) + T(4,2)*T1(1,4)*T2(2,1) + 
     -  T(1,1)*T1(2,1)*T2(2,1) - T(2,2)*T1(2,1)*T2(2,1) + 
     -  T(3,3)*T1(2,1)*T2(2,1) + T(4,4)*T1(2,1)*T2(2,1) - 
     -  T(1,3)*T1(2,3)*T2(2,1) - T(3,1)*T1(2,3)*T2(2,1) - 
     -  T(1,4)*T1(2,4)*T2(2,1) - T(4,1)*T1(2,4)*T2(2,1) - 
     -  T(2,3)*T1(3,1)*T2(2,1) - T(3,2)*T1(3,1)*T2(2,1) + 
     -  T(1,3)*T1(3,2)*T2(2,1) + T(3,1)*T1(3,2)*T2(2,1) - 
     -  T(2,4)*T1(4,1)*T2(2,1) - T(4,2)*T1(4,1)*T2(2,1) + 
     -  T(1,4)*T1(4,2)*T2(2,1) + T(4,1)*T1(4,2)*T2(2,1) + 
     -  T(1,3)*T1(1,2)*T2(2,3) + T(3,1)*T1(1,2)*T2(2,3) - 
     -  T(1,2)*T1(1,3)*T2(2,3) - T(2,1)*T1(1,3)*T2(2,3) - 
     -  T(1,3)*T1(2,1)*T2(2,3) - T(3,1)*T1(2,1)*T2(2,3) + 
     -  T(1,1)*T1(2,3)*T2(2,3) + T(2,2)*T1(2,3)*T2(2,3) + 
     -  T(3,3)*T1(2,3)*T2(2,3) - T(4,4)*T1(2,3)*T2(2,3) + 
     -  T(3,4)*T1(2,4)*T2(2,3) + T(4,3)*T1(2,4)*T2(2,3) + 
     -  T(1,2)*T1(3,1)*T2(2,3) + T(2,1)*T1(3,1)*T2(2,3) - 
     -  T(1,1)*T1(3,2)*T2(2,3) - T(2,2)*T1(3,2)*T2(2,3) - 
     -  T(3,3)*T1(3,2)*T2(2,3) + T(4,4)*T1(3,2)*T2(2,3) - 
     -  T(2,4)*T1(3,4)*T2(2,3) - T(4,2)*T1(3,4)*T2(2,3) - 
     -  T(3,4)*T1(4,2)*T2(2,3) - T(4,3)*T1(4,2)*T2(2,3) + 
     -  T(2,4)*T1(4,3)*T2(2,3) + T(4,2)*T1(4,3)*T2(2,3) + 
     -  T(1,4)*T1(1,2)*T2(2,4) + T(4,1)*T1(1,2)*T2(2,4) - 
     -  T(1,2)*T1(1,4)*T2(2,4) - T(2,1)*T1(1,4)*T2(2,4) - 
     -  T(1,4)*T1(2,1)*T2(2,4) - T(4,1)*T1(2,1)*T2(2,4) + 
     -  T(3,4)*T1(2,3)*T2(2,4) + T(4,3)*T1(2,3)*T2(2,4) + 
     -  T(1,1)*T1(2,4)*T2(2,4) + T(2,2)*T1(2,4)*T2(2,4) - 
     -  T(3,3)*T1(2,4)*T2(2,4) + T(4,4)*T1(2,4)*T2(2,4) - 
     -  T(3,4)*T1(3,2)*T2(2,4) - T(4,3)*T1(3,2)*T2(2,4) + 
     -  T(2,3)*T1(3,4)*T2(2,4) + T(3,2)*T1(3,4)*T2(2,4) + 
     -  T(1,2)*T1(4,1)*T2(2,4) + T(2,1)*T1(4,1)*T2(2,4) - 
     -  T(1,1)*T1(4,2)*T2(2,4) - T(2,2)*T1(4,2)*T2(2,4) + 
     -  T(3,3)*T1(4,2)*T2(2,4) - T(4,4)*T1(4,2)*T2(2,4) - 
     -  T(2,3)*T1(4,3)*T2(2,4) - T(3,2)*T1(4,3)*T2(2,4) + 
     -  T(2,3)*T1(1,2)*T2(3,1) + T(3,2)*T1(1,2)*T2(3,1) - 
     -  T(1,1)*T1(1,3)*T2(3,1) - T(2,2)*T1(1,3)*T2(3,1) + 
     -  T(3,3)*T1(1,3)*T2(3,1) - T(4,4)*T1(1,3)*T2(3,1) + 
     -  T(3,4)*T1(1,4)*T2(3,1) + T(4,3)*T1(1,4)*T2(3,1) - 
     -  T(2,3)*T1(2,1)*T2(3,1) - T(3,2)*T1(2,1)*T2(3,1) + 
     -  T(1,2)*T1(2,3)*T2(3,1) + T(2,1)*T1(2,3)*T2(3,1) + 
     -  T(1,1)*T1(3,1)*T2(3,1) + T(2,2)*T1(3,1)*T2(3,1) - 
     -  T(3,3)*T1(3,1)*T2(3,1) + T(4,4)*T1(3,1)*T2(3,1) - 
     -  T(1,2)*T1(3,2)*T2(3,1) - T(2,1)*T1(3,2)*T2(3,1) - 
     -  T(1,4)*T1(3,4)*T2(3,1) - T(4,1)*T1(3,4)*T2(3,1) - 
     -  T(3,4)*T1(4,1)*T2(3,1) - T(4,3)*T1(4,1)*T2(3,1) + 
     -  T(1,4)*T1(4,3)*T2(3,1) + T(4,1)*T1(4,3)*T2(3,1) - 
     -  T(1,3)*T1(1,2)*T2(3,2) - T(3,1)*T1(1,2)*T2(3,2) + 
     -  T(1,2)*T1(1,3)*T2(3,2) + T(2,1)*T1(1,3)*T2(3,2) + 
     -  T(1,3)*T1(2,1)*T2(3,2) + T(3,1)*T1(2,1)*T2(3,2) - 
     -  T(1,1)*T1(2,3)*T2(3,2) - T(2,2)*T1(2,3)*T2(3,2) - 
     -  T(3,3)*T1(2,3)*T2(3,2) + T(4,4)*T1(2,3)*T2(3,2) - 
     -  T(3,4)*T1(2,4)*T2(3,2) - T(4,3)*T1(2,4)*T2(3,2) - 
     -  T(1,2)*T1(3,1)*T2(3,2) - T(2,1)*T1(3,1)*T2(3,2) + 
     -  T(1,1)*T1(3,2)*T2(3,2) + T(2,2)*T1(3,2)*T2(3,2) + 
     -  T(3,3)*T1(3,2)*T2(3,2) - T(4,4)*T1(3,2)*T2(3,2) + 
     -  T(2,4)*T1(3,4)*T2(3,2) + T(4,2)*T1(3,4)*T2(3,2) + 
     -  T(3,4)*T1(4,2)*T2(3,2) + T(4,3)*T1(4,2)*T2(3,2) - 
     -  T(2,4)*T1(4,3)*T2(3,2) - T(4,2)*T1(4,3)*T2(3,2) + 
     -  T(1,4)*T1(1,3)*T2(3,4) + T(4,1)*T1(1,3)*T2(3,4) - 
     -  T(1,3)*T1(1,4)*T2(3,4) - T(3,1)*T1(1,4)*T2(3,4) - 
     -  T(2,4)*T1(2,3)*T2(3,4) - T(4,2)*T1(2,3)*T2(3,4) + 
     -  T(2,3)*T1(2,4)*T2(3,4) + T(3,2)*T1(2,4)*T2(3,4) - 
     -  T(1,4)*T1(3,1)*T2(3,4) - T(4,1)*T1(3,1)*T2(3,4) + 
     -  T(2,4)*T1(3,2)*T2(3,4) + T(4,2)*T1(3,2)*T2(3,4) + 
     -  T(1,1)*T1(3,4)*T2(3,4) - T(2,2)*T1(3,4)*T2(3,4) + 
     -  T(3,3)*T1(3,4)*T2(3,4) + T(4,4)*T1(3,4)*T2(3,4) + 
     -  T(1,3)*T1(4,1)*T2(3,4) + T(3,1)*T1(4,1)*T2(3,4) - 
     -  T(2,3)*T1(4,2)*T2(3,4) - T(3,2)*T1(4,2)*T2(3,4) - 
     -  T(1,1)*T1(4,3)*T2(3,4) + T(2,2)*T1(4,3)*T2(3,4) - 
     -  T(3,3)*T1(4,3)*T2(3,4) - T(4,4)*T1(4,3)*T2(3,4) + 
     -  T(2,4)*T1(1,2)*T2(4,1) + T(4,2)*T1(1,2)*T2(4,1) + 
     -  T(3,4)*T1(1,3)*T2(4,1) + T(4,3)*T1(1,3)*T2(4,1) - 
     -  T(1,1)*T1(1,4)*T2(4,1) - T(2,2)*T1(1,4)*T2(4,1) - 
     -  T(3,3)*T1(1,4)*T2(4,1) + T(4,4)*T1(1,4)*T2(4,1) - 
     -  T(2,4)*T1(2,1)*T2(4,1) - T(4,2)*T1(2,1)*T2(4,1) + 
     -  T(1,2)*T1(2,4)*T2(4,1) + T(2,1)*T1(2,4)*T2(4,1) - 
     -  T(3,4)*T1(3,1)*T2(4,1) - T(4,3)*T1(3,1)*T2(4,1) + 
     -  T(1,3)*T1(3,4)*T2(4,1) + T(3,1)*T1(3,4)*T2(4,1) + 
     -  T(1,1)*T1(4,1)*T2(4,1) + T(2,2)*T1(4,1)*T2(4,1) + 
     -  T(3,3)*T1(4,1)*T2(4,1) - T(4,4)*T1(4,1)*T2(4,1) - 
     -  T(1,2)*T1(4,2)*T2(4,1) - T(2,1)*T1(4,2)*T2(4,1) - 
     -  T(1,3)*T1(4,3)*T2(4,1) - T(3,1)*T1(4,3)*T2(4,1) - 
     -  T(1,4)*T1(1,2)*T2(4,2) - T(4,1)*T1(1,2)*T2(4,2) + 
     -  T(1,2)*T1(1,4)*T2(4,2) + T(2,1)*T1(1,4)*T2(4,2) + 
     -  T(1,4)*T1(2,1)*T2(4,2) + T(4,1)*T1(2,1)*T2(4,2) - 
     -  T(3,4)*T1(2,3)*T2(4,2) - T(4,3)*T1(2,3)*T2(4,2) - 
     -  T(1,1)*T1(2,4)*T2(4,2) - T(2,2)*T1(2,4)*T2(4,2) + 
     -  T(3,3)*T1(2,4)*T2(4,2) - T(4,4)*T1(2,4)*T2(4,2) + 
     -  T(3,4)*T1(3,2)*T2(4,2) + T(4,3)*T1(3,2)*T2(4,2) - 
     -  T(2,3)*T1(3,4)*T2(4,2) - T(3,2)*T1(3,4)*T2(4,2) - 
     -  T(1,2)*T1(4,1)*T2(4,2) - T(2,1)*T1(4,1)*T2(4,2) + 
     -  T(1,1)*T1(4,2)*T2(4,2) + T(2,2)*T1(4,2)*T2(4,2) - 
     -  T(3,3)*T1(4,2)*T2(4,2) + T(4,4)*T1(4,2)*T2(4,2) + 
     -  T(2,3)*T1(4,3)*T2(4,2) + T(3,2)*T1(4,3)*T2(4,2) - 
     -  T(1,4)*T1(1,3)*T2(4,3) - T(4,1)*T1(1,3)*T2(4,3) + 
     -  T(1,3)*T1(1,4)*T2(4,3) + T(3,1)*T1(1,4)*T2(4,3) + 
     -  T(2,4)*T1(2,3)*T2(4,3) + T(4,2)*T1(2,3)*T2(4,3) - 
     -  T(2,3)*T1(2,4)*T2(4,3) - T(3,2)*T1(2,4)*T2(4,3) + 
     -  T(1,4)*T1(3,1)*T2(4,3) + T(4,1)*T1(3,1)*T2(4,3) - 
     -  T(2,4)*T1(3,2)*T2(4,3) - T(4,2)*T1(3,2)*T2(4,3) - 
     -  T(1,1)*T1(3,4)*T2(4,3) + T(2,2)*T1(3,4)*T2(4,3) - 
     -  T(3,3)*T1(3,4)*T2(4,3) - T(4,4)*T1(3,4)*T2(4,3) - 
     -  T(1,3)*T1(4,1)*T2(4,3) - T(3,1)*T1(4,1)*T2(4,3) + 
     -  T(2,3)*T1(4,2)*T2(4,3) + T(3,2)*T1(4,2)*T2(4,3) + 
     -  T(1,1)*T1(4,3)*T2(4,3) - T(2,2)*T1(4,3)*T2(4,3) + 
     -  T(3,3)*T1(4,3)*T2(4,3) + T(4,4)*T1(4,3)*T2(4,3))

       return
       end

