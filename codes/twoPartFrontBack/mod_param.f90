      module mod_param
      implicit none
      save
              
      real*8,parameter::t=2.5d3
      real*8,parameter::tt=0.d0
      real*8,parameter::dt=1.d-3
      real*8,parameter::Teq=1.d-1
      real*8,parameter::gama=1.d0
      real*8,parameter::D0=Teq/gama
      real*8,parameter::m=1.d0
      real*8,parameter::f0=2.d0
      real*8,parameter::taup=5.d1
      real*8,parameter::Dr=1.d0/taup!3.d0*D0
 
      real*8,parameter::pi=dacos(-1.d0)
      
      integer*8,parameter::ntraj=100
      integer*8,parameter::nsnap=50
      integer*8,parameter::nA=3276,nB=1762
      integer*8,parameter::nC=2
      integer*8,parameter::n=nA+nB+nC
      integer*8,parameter::nt=nint(t/dt)
      integer*8,parameter::ntt=nint(tt/dt)
      integer*8,parameter::mt=200
      integer*8,parameter::nframe=2000
      integer*8,parameter::nframe2=NINT(t)
      integer*8,parameter::ncel=1849
      integer*8,parameter::nclsq=43

      real*8,parameter::epsaa=1.0d0,sigaa=1.00d0
      real*8,parameter::epsab=1.5d0,sigab=0.80d0
      real*8,parameter::epsbb=0.5d0,sigbb=0.88d0
      real*8,parameter::epsac=1.5d0,sigac=0.80d0
      real*8,parameter::epsbc=0.5d0,sigbc=0.88d0
      real*8,parameter::epscc=0.5d0,sigcc=0.88d0

      real*8,parameter::skindif=0.5d0,cutoff=1.5d0
      real*8,parameter::fact=skindif*skindif/4.d0
      real*8,parameter::L0=9.0d1
      real*8,parameter::Lx=L0
      real*8,parameter::Ly=L0
      real*8,parameter::Lcell=L0/dfloat(nclsq)
     
      real*8::x(1:n),y(1:n)
      real*8::xtemp(1:n),ytemp(1:n)
      real*8::fx(1:n),fy(1:n)
      real*8::fxtemp(1:n),fytemp(1:n)
      real*8::fx_ran(1:n),fy_ran(1:n)
      real*8::x0(1:n),y0(1:n)
      real*8::sig(3,3),eps(3,3),fc(3,3)
      real*8::xs(1:n),ys(1:n)
      real*8::rc(3,3),rc2(3,3)
      real*8::v0(3,3),v2(3,3),v4(3,3)
      real*8::f2(3,3),f4(3,3)
      real*8::rskin(3,3),rskin2(3,3)
      real*8::sig2(3,3)
      real*8::theta(1:n)
 
      integer::list(1:n)
      integer::lcount(1:ncel)
      integer::cell_list(1:ncel,1:250)
      integer::cell_nebr(1:ncel,1:5)

      real*8::sr2,sr4,sr6,sr12
      real*8::pe,ke
                          
      integer::pt(1:n),point(1:n,1:250)
      integer::neibr(1:n),seed1,seed2
      real*8::xdata(1:n),ydata(1:n)

      integer,parameter::icorrdim=200,icorrdim2=200
      integer::itime,nwrite
      integer::icortim(icorrdim),icortimwt(icorrdim2)
      integer::itimewrite(icorrdim*icorrdim2)

      character*132::file0,fichier

      end module mod_param
