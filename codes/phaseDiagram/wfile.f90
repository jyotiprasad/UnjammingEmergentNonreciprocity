      subroutine wfile(myrank,nprocs)
      use mod_param
      implicit none

      integer::nprocs,myrank,i
      character*80::fm1,fm2,fm3,fm4

      write(fm1,'("data/others/position",I3.3)')myrank
      open(unit=301,file=TRIM(fm1),status='unknown')

      write(fm3,'("data/others/particle",I3.3)')myrank
      open(unit=303,file=TRIM(fm3),status='unknown')

      write(fm4,'("data/others/cell_inf",I3.3)')myrank
      open(unit=304,file=TRIM(fm4),status='unknown')


      do i=1,n

      xdata(i)=x(i)-Lx*anint(x(i)/Lx)
      ydata(i)=y(i)-Ly*anint(y(i)/Ly)

      enddo


      do i=1,n

      write(301,310)xdata(i),ydata(i)
      write(303,311)pt(i)

      enddo

      do i=1,ncel

      write(304,1300)cell_nebr(i,1),cell_nebr(i,2),cell_nebr(i,3), &
      cell_nebr(i,4),cell_nebr(i,5)

      enddo

310   format(2(1x,e18.12))
311   format(i5)
1300  format(5(2x,I5))

      close(301)
      close(303);close(304)

      end subroutine wfile
