      subroutine vnlist
      use mod_param
      implicit none

      real*8::dr2,xr,yr
      integer::i,j
      integer::il,jl1,jl2,ik

      neibr=0
      point=0

      call listcell

      do i=1,n

      il=list(i)
      neibr(i)=0
      
      do ik=1,lcount(il)
    
      j=cell_list(il,ik)

      if(i.lt.j) then

      xr=x(i)-x(j)
      yr=y(i)-y(j)

      xr=xr-Lx*anint(xr/Lx)
      yr=yr-Ly*anint(yr/Ly)
      
      dr2=xr*xr+yr*yr

      if(dr2.lt.rskin2(pt(i),pt(j))) then

      neibr(i)=neibr(i)+1
      point(i,neibr(i))=j

      endif
      endif

      enddo

      enddo


      do i=1,n

      il=list(i)
     
      do jl1=2,5
      
      jl2=cell_nebr(il,jl1)

      do ik=1,lcount(jl2)
    
      j=cell_list(jl2,ik)

      xr=x(i)-x(j)
      yr=y(i)-y(j)

      xr=xr-Lx*anint(xr/Lx)
      yr=yr-Ly*anint(yr/Ly)
      
      dr2=xr*xr+yr*yr

      if(dr2.lt.rskin2(pt(i),pt(j))) then

      if(i.lt.j) then

      neibr(i)=neibr(i)+1
      point(i,neibr(i))=j

      else

      neibr(j)=neibr(j)+1
      point(j,neibr(j))=i

      endif
      endif

      enddo
      enddo

      enddo

      xs=x
      ys=y

      end subroutine
