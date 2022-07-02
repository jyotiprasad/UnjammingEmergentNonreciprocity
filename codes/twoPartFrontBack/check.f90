        program check
        implicit none
        integer, parameter :: N = 5040, NPROC = 256
        integer :: PT(1:N), I, IPROC
        CHARACTER(LEN=144) :: X1, FMT
        
        FMT='(i3.3)'
        DO IPROC = 1, NPROC

        WRITE(X1,FMT) (IPROC-1)
        
        OPEN(UNIT=101,FILE='data/input/particle'//TRIM(X1))
        DO I = 1, N
        READ(101,*) PT(I)
        IF(PT(I).EQ.3) PT(I) = 2
        ENDDO !I
        CLOSE(101)

        OPEN(UNIT=201,FILE='data/input/particle'//TRIM(X1))
        DO I = 1, N
        WRITE(201,*) PT(I)
        ENDDO !I
        CLOSE(201)

        ENDDO !IPROC

        stop
        end program check
