      subroutine int_write(ncorrel,ncorrelwt,step,myrank)
      use mod_param
      implicit none      

      integer::ncorrel,ncorrelwt,step
      integer::myrank,iwr
      integer::ndumpstep,ntotstep
      integer::k,j,ncorrelnew,ii
      integer::ncorrelwtnew,l

      character*80::fname0,fname1,fname2
      character*80::fname
      character*8::fm1,fm2,ind1,ind2
      
      write(fname0,'("data/logtime/wt","_",I3.3)')
     &myrank
      open(unit=33,file=TRIM(fname0),status='unknown')

      write(fname1,'("data/logtime/tot_tf","_",I3.3)')
     &myrank
      open(unit=35,file=TRIM(fname1),status='unknown')

      write(fname2,'("data/logtime/WRITETIMES","_",I3.3)')
     &myrank
      open(unit=36,file=TRIM(fname2),status='unknown')
      
      ndumpstep=step
      ntotstep=step
        
      do k=1,ncorrel
      icortim(k)=nint(dfloat(ndumpstep)**(k/dfloat(ncorrel)))
      enddo
      icortim(1)=0

      k=1
      j=2

20    if(j.gt.ncorrel) goto 30
      if(icortim(j).ne.icortim(k)) then
      k=k+1
      icortim(k)=icortim(j)
      j=j+1
      else
      j=j+1
      endif
      goto 20

30    if(ncorrel.eq.0.or.ndumpstep.le.1) then
      ncorrelnew=0
      else
      ncorrelnew=k
      endif

      do k=1,ncorrelnew
      write(33,*)icortim(k)
      enddo
      close(33)

      j=ncorrelwt
      ncorrelwtnew=ncorrelwt
      do k=1,j
      icortimwt(k)=(k-1)*nint(ntotstep/dfloat(j))
      ENDDO

      ii=0
      do k=1,ncorrelwtnew
      do l=1,ncorrelnew
      ii=ii+1
      itimewrite(ii)=icortim(l)+icortimwt(k)
      enddo
      enddo

      iwr=ncorrelnew*ncorrelwtnew
     
      do ii=1,iwr
      write(35,*)itimewrite(ii)
      enddo

      call sort(iwr,itimewrite)

      nwrite=1

      do ii=1,iwr
      write(36,*)itimewrite(ii)
      enddo

      call flushkob(36)
      
      close(35)
      close(36)

      write(fname,'("data/others/filename","_",I3.3)')
     &myrank
      open(unit=34,file=TRIM(fname),status='unknown')
 
      fm2='(I2.2)'

      write(ind2,fm2)myrank
      write(34,*)"'data/config/coord_"//trim(ind2)//"_'"
      
      close(34)

      write(fname,'("data/others/filename","_",I3.3)')
     &myrank
      open(unit=34,file=TRIM(fname),status='old')

      read(34,*)file0 
 
      itime=0
      nwrite=1
      if(itime.eq.itimewrite(nwrite)) then
      fichier=file0
   
      call addnumtostring(fichier,itime)
   
      open(75,file=fichier,status='unknown')
   
      do j=1,n
      write(75,103)x(j),y(j)
      enddo
      close(75)
      endif
      nwrite=nwrite+1

      close(34)

103   format(2(1x,f18.11))

      end subroutine int_write
