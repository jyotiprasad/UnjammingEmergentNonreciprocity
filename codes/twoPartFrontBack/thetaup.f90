      subroutine thetaup
      use mod_param
      implicit none

      integer::i     
      real*8::gasdev2,ran22
      real*8::rz

      do i=1,n

      if(pt(i).eq.3) then
      rz=gasdev2(seed2)
      theta(i)=theta(i)+dsqrt(2.d0*Dr*dt)*rz
      endif

      enddo
      
      end subroutine thetaup


      FUNCTION gasdev2(idum)
      INTEGER idum
      REAL*8 gasdev2
      INTEGER iset
      REAL*8 fac,gset,rsq,v1,v2,ran22
      SAVE iset,gset
      DATA iset/0/
      if (iset.eq.0) then
1     v1=2.*ran22(idum)-1.
      v2=2.*ran22(idum)-1.
      rsq=v1**2+v2**2
      if(rsq.ge.1..or.rsq.eq.0.)goto 1
      fac=sqrt(-2.*log(rsq)/rsq)
      gset=v1*fac
      gasdev2=v2*fac
      iset=1
      else
      gasdev2=gset
      iset=0
      endif
      return
      end


      FUNCTION ran22(idum)
      INTEGER idum,IM1,IM2,IMM1,IA1,IA2,IQ1,IQ2,IR1,IR2,NTAB,NDIV
      REAL*8 ran22,AM,EPS,RNMX
      PARAMETER(IM1=2147483563,IM2=2147483399,AM=1./IM1,IMM1=IM1-1)
      parameter(IA1=40014,IA2=40692,IQ1=53668,IQ2=52774,IR1=12211)
      parameter(IR2=3791,NTAB=32,NDIV=1+IMM1/NTAB)
      parameter(EPS=1.2e-7,RNMX=1.-EPS)
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
      ran22=min(AM*iy,RNMX)
      return
      end
