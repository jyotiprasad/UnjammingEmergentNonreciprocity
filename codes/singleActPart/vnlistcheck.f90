      subroutine vnlistcheck
      use mod_param
      implicit none

      real*8::xr,yr,dr2,displ
      integer::i

      displ=0.d0

      do i=1,n
   
      xr=x(i)-xs(i)
      yr=y(i)-ys(i)
      
      xr=xr-Lx*anint(xr/Lx)
      yr=yr-Ly*anint(yr/Ly)
      
      dr2=xr*xr+yr*yr

      displ=max(displ,dr2)

      enddo

      if(displ.ge.fact) call vnlist     
      
      end subroutine
