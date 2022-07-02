      subroutine energy
      use mod_param
      implicit none

      integer::i,j,k
      integer::p1,p2
      real*8::xr,yr,r6,r4,r2,d2
      real*8::e1,e2

      pe=0.d0
      ke=0.d0

      call vnlistcheck
      
      do i=1,n
      
      do k=1,neibr(i)
      
      j=point(i,k)

      p1=pt(i)
      p2=pt(j)

      xr=x(i)-x(j)
      yr=y(i)-y(j)

      xr=xr-Lx*anint(xr/Lx)
      yr=yr-Ly*anint(yr/Ly)

      d2=xr*xr+yr*yr

      if(d2.lt.rc2(p1,p2)) then

      r2=sig2(p1,p2)/d2
      r4=r2*r2
      r6=r4*r2
      e1=4.d0*eps(p1,p2)*r6*r6+v0(p1,p2)+ &
      (v2(p1,p2)/r2)+(v4(p1,p2)/r4)
      pe=pe+e1/dfloat(n)
      
      endif

      enddo

      e2=0.5d0*m*(vx(i)*vx(i)+vy(i)*vy(i))/dfloat(n)
      ke=ke+e2

      enddo
 
      end subroutine energy
