      subroutine listcell
      use mod_param
      implicit none

      integer::i,i1,i2,i3

      lcount=0

      do i=1,n

      xdata(i)=x(i)-Lx*anint(x(i)/Lx)
      ydata(i)=y(i)-Ly*anint(y(i)/Ly)

      i1=int((xdata(i)+(Lx/2.d0))/Lcell)+1
      i2=int((ydata(i)+(Ly/2.d0))/Lcell)+1

      i3=(i2-1)*nclsq+i1

      lcount(i3)=lcount(i3)+1

      list(i)=i3
      cell_list(i3,lcount(i3))=i

      enddo

      end subroutine
