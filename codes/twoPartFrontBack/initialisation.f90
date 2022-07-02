      subroutine initialisation(myrank)
      use mod_param
      implicit none

      integer::i,j,myrank
      real::z
      character*80::fn1,fn2,fn3,fn4     
      character*80::name0,name1
      character*80::name2,name3
      character*80::name4,name5
      character*80::name6,name7
      character*80::name8,name9,name10

      write(fn1,'("data/input/position",I3.3)')myrank
      open(unit=241,file=TRIM(fn1),status='unknown')

      write(fn3,'("data/input/particle",I3.3)')myrank
      open(unit=243,file=TRIM(fn3),status='unknown')

      write(fn4,'("data/input/cell_inf",I3.3)')myrank
      open(unit=244,file=TRIM(fn4),status='unknown')  
 
      write(name4,'("data/movie/theta",I3.3)')myrank
      open(unit=778,file=TRIM(name4),status='unknown')

      write(name7,'("data/linconfig/conf",I3.3)')myrank
      open(unit=1155,file=TRIM(name7),status='unknown')

      do i=1,n

      read(241,*)x(i),y(i)
      read(243,*)pt(i)    

      enddo

      do i=1,ncel

      read(244,1200)cell_nebr(i,1),cell_nebr(i,2),cell_nebr(i,3), &
      cell_nebr(i,4),cell_nebr(i,5)

      enddo

1200  format(5(2x,I5))

      do i=1,n

      xdata(i)=x(i)-Lx*anint(x(i)/Lx)
      ydata(i)=y(i)-Ly*anint(y(i)/Ly)

      enddo

      close(241);close(242)
      close(243);close(244)
      
      seed1=-11-myrank
      seed2=-13-myrank

      call vnlist
      call force

      do i=1,n
      theta(i)=0.d0
      !if(pt(i).eq.3) then
      !call random_number(z)
      !theta(i)=(z-0.5)*2.d0*pi
      !endif
      enddo


      end subroutine initialisation
