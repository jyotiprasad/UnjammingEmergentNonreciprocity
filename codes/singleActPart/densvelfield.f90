        PROGRAM DENSVELFIELD

        ! Calculates coarse-grained density and velocity fields from
        ! from system configuration (positions only ) at different times
        ! for each processor, without any gap for 'pm3d map' plotting
        
        IMPLICIT NONE

        INTEGER, PARAMETER :: N = 5040
        INTEGER, PARAMETER :: FRAMEST = 2
        INTEGER, PARAMETER :: FRAMEND = 500
        INTEGER, PARAMETER :: TGAP = 1
        INTEGER, PARAMETER :: NGRID = 45
         REAL*8, PARAMETER :: L0 = 9.0D1, R0 = 1.2D0
         REAL*8, PARAMETER :: DT = 1.D0*TGAP
         REAL*8, PARAMETER :: NFRAME = 1.D0 + 1.D0*(FRAMEND-FRAMEST)/DT
         REAL*8, PARAMETER :: dX = L0/(1.D0*NGRID), dY = dX
                   INTEGER :: I, J, I0, J0, K, IFRAME
                   INTEGER :: PT, JC
                    REAL*8 :: X(1:N), Y(1:N), XN(1:N), YN(1:N)
                    REAL*8 :: XPR(1:N), YPR(1:N)
                    REAL*8 :: VX(1:N), VY(1:N)
                    REAL*8 :: XI0(1:NGRID), YJ0(1:NGRID)
                    REAL*8 :: RX, RY, RK
                    REAL*8 :: RHO(1:NGRID, 1:NGRID)
                    REAL*8 :: RHOVX(1:NGRID, 1:NGRID)
                    REAL*8 :: RHOVY(1:NGRID, 1:NGRID)
                    REAL*8 :: RHOAV(1:NGRID, 1:NGRID)
                    REAL*8 :: RHOAVVX(1:NGRID, 1:NGRID)
                    REAL*8 :: RHOAVVY(1:NGRID, 1:NGRID)
                    REAL*8 :: SUMRHO, CONST, DRIFTX, DRIFTY

        CHARACTER(LEN=144) :: X1, FMT
                   INTEGER :: IERR,NODEID,SIZE

       INCLUDE 'mpif.h'

       CALL MPI_INIT(IERR)
       CALL MPI_COMM_RANK(MPI_COMM_WORLD,NODEID,IERR)
       CALL MPI_COMM_SIZE(MPI_COMM_WORLD,SIZE,IERR)

       FMT='(i3.3)'
       WRITE(X1,FMT) NODEID

       OPEN(UNIT=200,FILE='data/linconfig/densvelfield'//TRIM(X1))

       DO I0 = 1, NGRID
       XI0(I0) = (-L0)*0.5D0 + (I0-0.5D0)*dX
       YJ0(I0) = (-L0)*0.5D0 + (I0-0.5D0)*dY
       ENDDO !I0

       RHOAV = 0.D0
       RHOAVVX = 0.D0; RHOAVVY = 0.D0

       OPEN(UNIT=102,FILE='data/input/particle'//TRIM(X1))
       DO J = 1, N
       READ(102,*) PT
       IF(PT.EQ.3) JC = J
       ENDDO !J
       CLOSE(102)

       OPEN(UNIT=103,FILE='data/linconfig/conf'//TRIM(X1))
       
       XPR = 0.D0; YPR = 0.D0
       DO IFRAME = 1, FRAMEND

       DO J = 1, N
       READ(103,*) X(J), Y(J)
       ENDDO !J

       IF((IFRAME.GE.FRAMEST).AND.(MOD(IFRAME,TGAP).EQ.0)) THEN

       DO K = 1, N
       XN(K) = X(K) - X(JC)
       YN(K) = Y(K) - Y(JC)
       XN(K) = XN(K) - L0*ANINT(XN(K)/L0)
       YN(K) = YN(K) - L0*ANINT(YN(K)/L0)
       VX(K) = X(K) - XPR(K)
       VY(K) = Y(K) - YPR(K)
       VX(K) = VX(K) - L0*ANINT(VX(K)/L0)
       VY(K) = VY(K) - L0*ANINT(VY(K)/L0)
       VX(K) = VX(K)/DT
       VY(K) = VY(K)/DT
       ENDDO !K

       SUMRHO = 0.D0
       DO I0 = 1, NGRID
       DO J0 = 1, NGRID
       RHO(I0, J0) = 0.D0
       DO K = 1, N
       IF(K.EQ.JC) GOTO 20
       RX = XN(K) - XI0(I0)
       RY = YN(K) - YJ0(J0) 
       RX = RX - L0*ANINT(RX/L0)
       RY = RY - L0*ANINT(RY/L0)
       RK = DSQRT(RX*RX + RY*RY)
       RHO(I0, J0) = RHO(I0, J0) + DEXP(-(RK/R0)) 
       RHOVX(I0, J0) = RHOVX(I0, J0) + VX(K)*DEXP(-RK/R0)
       RHOVY(I0, J0) = RHOVY(I0, J0) + VY(K)*DEXP(-RK/R0)
 20    ENDDO !K
       SUMRHO = SUMRHO + RHO(I0, J0)
       ENDDO !J0
       ENDDO !I0

       CONST = ((N-1)*1.D0)/(SUMRHO*DX*DY)
       DO I0 = 1, NGRID
       DO J0 = 1, NGRID
       RHO(I0, J0) = RHO(I0, J0)*CONST
       RHOVX(I0, J0) = RHOVX(I0, J0)*CONST
       RHOVY(I0, J0) = RHOVY(I0, J0)*CONST
       RHOAV(I0, J0) = RHOAV(I0, J0) + RHO(I0, J0)
       RHOAVVX(I0, J0) = RHOAVVX(I0, J0) + RHOVX(I0, J0)
       RHOAVVY(I0, J0) = RHOAVVY(I0, J0) + RHOVY(I0, J0)
       ENDDO !J0
       ENDDO !I0

       ENDIF !(IFRAME.GE.FRAMEST)

       IF(MOD(IFRAME,TGAP).EQ.0) THEN
       XPR = X
       YPR = Y
       ENDIF
       ENDDO !IFRAME
       CLOSE(103)


       DRIFTX = 0.D0; DRIFTY = 0.D0
       DO I0 = 1, NGRID
       DO J0 = 1, NGRID
       DRIFTX = DRIFTX + RHOAVVX(I0, J0)
       DRIFTY = DRIFTY + RHOAVVY(I0, J0)
       ENDDO !J0
       ENDDO !I0
       DRIFTX = DRIFTX/(NGRID*NGRID)
       DRIFTY = DRIFTY/(NGRID*NGRID)

       DO I0 = 1, NGRID
       DO J0 = 1, NGRID
       RHOAV(I0,J0) = RHOAV(I0,J0)/(1.D0*NFRAME)
       RHOAVVX(I0,J0) = (RHOAVVX(I0,J0)-DRIFTX)/(1.D0*NFRAME)
       RHOAVVY(I0,J0) = (RHOAVVY(I0,J0)-DRIFTY)/(1.D0*NFRAME)
       WRITE(200,*) XI0(I0), YJ0(J0), RHOAV(I0, J0), RHOAVVX(I0, J0),&
       RHOAVVY(I0, J0)
       ENDDO !J0
       ENDDO !I0

       CLOSE(200)

       CALL MPI_FINALIZE(IERR)
       STOP
       END PROGRAM DENSVELFIELD
