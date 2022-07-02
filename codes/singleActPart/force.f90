      subroutine force
      use mod_param
      implicit none

      integer::i,j,k
      integer::p1,p2
      real*8::xr,yr,r8
      real*8::f,r2,d2,r6

      fx=0.d0
      fy=0.d0

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
      r6=r2*r2*r2
      r8=r6*r2
      f=fc(p1,p2)*(r8*r6+f2(p1,p2)+(f4(p1,p2)/r2))

      fx(i)=fx(i)+f*xr
      fy(i)=fy(i)+f*yr
      
      fx(j)=fx(j)-f*xr
      fy(j)=fy(j)-f*yr
      
      endif

      enddo
    
      enddo

     !!!!!!!!! ACTIVE FORCE !!!!!!!!!

      do i=1,n
      if(pt(i).eq.3) then
      fx(i)=fx(i)+f0*dcos(theta(i))
      fy(i)=fy(i)+f0*dsin(theta(i))
      endif
      enddo

      end subroutine force
