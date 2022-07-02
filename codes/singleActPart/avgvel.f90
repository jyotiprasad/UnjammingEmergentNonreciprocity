        PROGRAM AVGVEL

        IMPLICIT NONE

        INTEGER, PARAMETER :: N = 1260
        INTEGER, PARAMETER :: NPROC = 64
        INTEGER, PARAMETER :: NFRAME = 200, FRAMEGAP = 1
         REAL*8, PARAMETER :: TGAP = 1.D0
         REAL*8, PARAMETER :: L0 = 4.5D1, DT = FRAMEGAP*TGAP
                   INTEGER :: J, IFRAME, IPROC
                   INTEGER :: PT, JC
                    REAL*8 :: DUMX, DUMY
                    REAL*8 :: X(1:NFRAME), Y(1:NFRAME)
                    REAL*8 :: RX, RY, VX, VY, V

        CHARACTER(LEN=144) :: X1, FMT

       FMT='(i2.2)'

       VX = 0.D0; VY = 0.D0
       DO IPROC = 1, NPROC
       WRITE(X1,FMT) (IPROC-1)

       OPEN(UNIT=102,FILE='data/input/particle'//TRIM(X1))
       DO J = 1, N
       READ(102,*) PT
       IF(PT.EQ.3) JC = J
       ENDDO !J
       CLOSE(102)

       OPEN(UNIT=103,FILE='data/linconfig/conf'//TRIM(X1))
       DO IFRAME = 1, NFRAME
       DO J = 1, N
       READ(103,*) DUMX, DUMY
       IF(J.EQ.JC) THEN
       X(IFRAME) = DUMX
       Y(IFRAME) = DUMY
       ENDIF
       ENDDO !J
       ENDDO !IFRAME
       CLOSE(103)

     
       DO IFRAME = 1, NFRAME - FRAMEGAP
       RX = X(IFRAME+FRAMEGAP) - X(IFRAME)
       RY = Y(IFRAME+FRAMEGAP) - Y(IFRAME)
       RX = RX - L0*ANINT(RX/L0)
       RY = RY - L0*ANINT(RY/L0)
       VX = VX + (RX/DT)
       VY = VY + (RY/DT)
       ENDDO !IFRAME

       ENDDO !IPROC

       VX = VX/(NPROC*(NFRAME-FRAMEGAP)*1.D0)
       VY = VY/(NPROC*(NFRAME-FRAMEGAP)*1.D0)
        V = DSQRT(VX*VX + VY*VY)

       WRITE(*,*) VX, VY, V

       STOP
       END PROGRAM AVGVEL
