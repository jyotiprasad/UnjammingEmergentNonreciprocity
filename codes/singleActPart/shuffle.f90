      subroutine Shuffle(a,ne)
      USE mod_param
      implicit none

      integer::ne
      integer::a(ne),temp
      integer::i, randpos
      real*8::r
 
      do i = size(a), 2, -1
      call random_number(r)
      randpos = int(r * i) + 1
      temp = a(randpos)
      a(randpos) = a(i)
      a(i) = temp
      end do

      end subroutine Shuffle
