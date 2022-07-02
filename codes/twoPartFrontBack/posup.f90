      subroutine posup
      use mod_param
      implicit none

      integer::i     
      real*8::gasdev1,ran21
      real*8::rz1,rz2

      xtemp=x
      ytemp=y

      fxtemp=fx
      fytemp=fy

      do i=1,n

      rz1=gasdev1(seed1)
      rz2=gasdev1(seed1)

      fx_ran(i)=dsqrt((2.d0*Teq*Teq)/(D0*dt))*rz1
      fy_ran(i)=dsqrt((2.d0*Teq*Teq)/(D0*dt))*rz2

      x(i)=x(i)+((fx(i)+fx_ran(i))/gama)*dt
      y(i)=y(i)+((fy(i)+fy_ran(i))/gama)*dt

      enddo

      call force

      do i=1,n

      fx(i)=(fx(i)+fxtemp(i))/2.d0
      fy(i)=(fy(i)+fytemp(i))/2.d0

      enddo

      do i=1,n

      x(i)=xtemp(i)+((fx(i)+fx_ran(i))/gama)*dt
      y(i)=ytemp(i)+((fy(i)+fy_ran(i))/gama)*dt

      enddo
      
      end subroutine posup


      FUNCTION gasdev1(idum)
      INTEGER idum
      REAL*8 gasdev1
      INTEGER iset
      REAL*8 fac,gset,rsq,v1,v2,ran21
      SAVE iset,gset
      DATA iset/0/
      if (iset.eq.0) then
1     v1=2.*ran21(idum)-1.
      v2=2.*ran21(idum)-1.
      rsq=v1**2+v2**2
      if(rsq.ge.1..or.rsq.eq.0.)goto 1
      fac=sqrt(-2.*log(rsq)/rsq)
      gset=v1*fac
      gasdev1=v2*fac
      iset=1
      else
      gasdev1=gset
      iset=0
      endif
      return
      end


      FUNCTION ran21(idum)
      INTEGER idum,IM1,IM2,IMM1,IA1,IA2,IQ1,IQ2,IR1,IR2,NTAB,NDIV
      REAL*8 ran21,AM,EPS,RNMX
      PARAMETER(IM1=2147483563,IM2=2147483399,AM=1./IM1,IMM1=IM1-1)
      parameter(IA1=40014,IA2=40692,IQ1=53668,IQ2=52774,IR1=12211)
      parameter(IR2=3791,NTAB=32,NDIV=1+IMM1/NTAB,EPS=1.2e-7,RNMX=1.-EPS)
      INTEGER idum2,j,k,iv(NTAB),iy
      SAVE iv,iy,idum2
      DATA idum2/123456789/, iv/NTAB*0/, iy/0/
      if (idum.le.0) then
      idum=max(-idum,1)
      idum2=idum
      do 11 j=NTAB+8,1,-1
      k=idum/IQ1
      idum=IA1*(idum-k*IQ1)-k*IR1
      if (idum.lt.0) idum=idum+IM1
      if (j.le.NTAB) iv(j)=idum
11    continue
      iy=iv(1)
      endif
      k=idum/IQ1
      idum=IA1*(idum-k*IQ1)-k*IR1
      if (idum.lt.0) idum=idum+IM1
      k=idum2/IQ2
      idum2=IA2*(idum2-k*IQ2)-k*IR2
      if (idum2.lt.0) idum2=idum2+IM2
      j=1+iy/NDIV
      iy=iv(j)-idum2
      iv(j)=idum
      if(iy.lt.1)iy=iy+IMM1
      ran21=min(AM*iy,RNMX)
      return
      end
