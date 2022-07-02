      program main
      use mod_param
      implicit none
      include "mpif.h"

      integer::ierr,nprocs,myrank
      integer::i
     
      call MPI_INIT(ierr)
      call MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
      call MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)    

      call int_param
      call initialisation(myrank)

      do i=1,ntt

      call sysupdate

      enddo


      call int_write(ntraj,nsnap,nt,myrank)

      do i=1,nt
      
      call sysupdate
      call wconfig(i,myrank)
      !call wenergy(i)

      enddo
      
      call wfile(myrank,nprocs)

      CALL MPI_FINALIZE(ierr)

      stop
      end
