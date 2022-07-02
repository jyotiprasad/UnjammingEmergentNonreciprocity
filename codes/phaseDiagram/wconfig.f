      subroutine wconfig(k,myrank)
      use mod_param
      implicit none
     
      integer::j,k,myrank 
      
      if(k.eq.itimewrite(nwrite)) then
      fichier=file0

      call addnumtostring(fichier,k)

      open(75,file=fichier,status='unknown')

      do j=1,n
      write(75,103)x(j),y(j)
      enddo
      close(75)

1000  nwrite=nwrite+1
      if(itimewrite(nwrite).eq.itimewrite(nwrite-1)) goto 1000
      endif

103   format(2(1x,f18.11))




      end subroutine wconfig

     
