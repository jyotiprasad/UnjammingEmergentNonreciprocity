       PROGRAM DENSVELFIELD_AVERAGE

       !Calculates average excess-density and velocity fields
       !from densvelfield data for active simulation

       IMPLICIT NONE

       INTEGER, PARAMETER :: NPROC = 256, NGRID = 45
       INTEGER, PARAMETER :: N = NGRID*NGRID
                  INTEGER :: I, J
                   REAL*8 :: X(1:N), Y(1:N)
                   REAL*8 :: VX(1:N), VY(1:N) 
                   REAL*8 :: R0(1:N), DUM
                   REAL*8 :: DR(1:N)
                   REAL*8 :: DRAV(1:N), DRSQAV(1:N), DRSIG(1:N)
                   REAL*8 :: VXAV(1:N), VXSQAV(1:N), VXSIG(1:N)
                   REAL*8 :: VYAV(1:N), VYSQAV(1:N), VYSIG(1:N)
       CHARACTER(LEN=144) :: FN1

       DRAV = 0.D0; DRSQAV = 0.D0
       VXAV = 0.D0; VXSQAV = 0.D0
       VYAV = 0.D0; VYSQAV = 0.D0

       DO I = 1, NPROC

       WRITE(FN1,'("data/linconfig/densvelfield",I3.3)') I-1
       OPEN(UNIT=100,FILE=TRIM(FN1),STATUS='UNKNOWN')       
       DO J = 1, N
       READ(100,*) X(J), Y(J), DR(J), VX(J), VY(J)
       ENDDO !J
       CLOSE(100)

       DRAV = DRAV + DR
       VXAV = VXAV + VX
       VYAV = VYAV + VY
       DRSQAV = DRSQAV + DR*DR
       VXSQAV = VXSQAV + VX*VX
       VYSQAV = VYSQAV + VY*VY

       ENDDO !I

       DRAV = DRAV/FLOAT(NPROC)
       VXAV = VXAV/FLOAT(NPROC)
       VYAV = VYAV/FLOAT(NPROC)
       DRSQAV = DRSQAV/FLOAT(NPROC)
       VXSQAV = VXSQAV/FLOAT(NPROC)
       VYSQAV = VYSQAV/FLOAT(NPROC)

       DRSIG = DSQRT(DRSQAV - (DRAV*DRAV))
       VXSIG = DSQRT(VXSQAV - (VXAV*VXAV))
       VYSIG = DSQRT(VYSQAV - (VYAV*VYAV))

       OPEN(UNIT=200,FILE='data/linconfig/densvelfield_av_nospace')
       DO J = 1, N
       WRITE(200,*) X(J), Y(J), DRAV(J), VXAV(J), VYAV(J), &
       DRSIG(J), VXSIG(J), VYSIG(J)
       ENDDO !J
       CLOSE(200)

       OPEN(UNIT=201,FILE='data/linconfig/densvelfield_av')
       DO J = 1, N
       WRITE(201,*) X(J), Y(J), DRAV(J), VXAV(J), VYAV(J), &
       DRSIG(J), VXSIG(J), VYSIG(J)
       IF(J.EQ.N) GOTO 20
       IF(MOD(J,NGRID).EQ.0) WRITE(201,*) '     '
       ENDDO !J
 20    CLOSE(201) 

       STOP
       END PROGRAM DENSVELFIELD_AVERAGE
