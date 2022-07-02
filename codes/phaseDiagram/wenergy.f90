      subroutine wenergy(i)
      use mod_param
      implicit none

      integer::i,j

      !if(mod(i,mt).eq.0) then
      !call energy
      !write(1100,1102)(float(i)*dt),pe,ke
      !endif

      if(mod(i,(nt/nframe2)).eq.0) then
      do j=1,n
      write(1155,*) x(j), y(j)
      !if(pt(j).eq.3) write(778,*) dcos(theta(j)),dsin(theta(j))
      enddo
      endif

1102  format(3(1x,e18.12))
      end subroutine wenergy
