        program check2
        implicit none
        integer, parameter :: N = 5040, NPROC = 256
        integer :: PT, I, IPROC
         real*8 :: X, Y
        CHARACTER(LEN=144) :: X1, FMT
        
        FMT='(i3.3)'
        DO IPROC = 1, NPROC

        WRITE(X1,FMT) (IPROC-1)
        
        OPEN(UNIT=101,FILE='data/input/particle'//TRIM(X1))
        OPEN(UNIT=102,FILE='data/input/position'//TRIM(X1))
        DO I = 1, N
        READ(101,*) PT
        READ(102,*) X, Y
        IF(PT.EQ.3) WRITE(*,*)'PROC=',IPROC-1,'JC', I,'POS(',X,Y,')'
        ENDDO !I
        CLOSE(101)
        CLOSE(102)

        ENDDO !IPROC

        stop
        end program check2
