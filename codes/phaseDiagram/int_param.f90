      subroutine int_param
      use mod_param
      implicit none

      integer::i,j
 
      sig(1,1)=sigaa;sig(1,2)=sigab;sig(1,3)=sigac
      sig(2,1)=sigab;sig(2,2)=sigbb;sig(2,3)=sigbc
      sig(3,1)=sigac;sig(3,2)=sigbc;sig(3,3)=sigcc

      eps(1,1)=epsaa;eps(1,2)=epsab;eps(1,3)=epsac
      eps(2,1)=epsab;eps(2,2)=epsbb;eps(2,3)=epsbc
      eps(3,1)=epsac;eps(3,2)=epsbc;eps(3,3)=epscc

      do i=1,3
      do j=1,3

      rc(i,j)=cutoff*sig(i,j)
      
      rc2(i,j)=rc(i,j)*rc(i,j)
     
      rskin(i,j)=rc(i,j)+skindif
      
      rskin2(i,j)=rskin(i,j)*rskin(i,j)
   
      sig2(i,j)=sig(i,j)*sig(i,j)
      
      fc(i,j)=48.d0*(eps(i,j)/sig2(i,j))

      sr2=sig2(i,j)/rc2(i,j)
      sr4=sr2*sr2
      sr6=sr4*sr2
      sr12=sr6*sr6

      f2(i,j)= 8.d0*sr12*sr2
      f4(i,j)=-7.d0*sr12*sr4

      v0(i,j)=-112.d0*eps(i,j)*sr12
      v2(i,j)= 192.d0*eps(i,j)*sr12*sr2
      v4(i,j)=- 84.d0*eps(i,j)*sr12*sr4
 
      enddo
      enddo      
   
      end subroutine int_param
