       PROGRAM DERIVATIVES
       IMPLICIT NONE

       INTEGER, PARAMETER :: N = 90, NPROC = 64
        REAL*8, PARAMETER :: R1 = 15.D0, R2 = 20.D0
        REAL*8, PARAMETER :: DX = 0.5D0, DY = 0.5D0
        REAL*8, PARAMETER :: RHO0 = 0.6221D0
                  INTEGER :: I, J, IPROC
                  INTEGER :: IP1, JP1, IM1, JM1
                   REAL*8 :: X(1:N,1:N), Y(1:N,1:N), DRHO(1:N,1:N)
                   REAL*8 :: VX(1:N,1:N), VY(1:N,1:N)
                   REAL*8 :: DUM, RHO(1:N,1:N)
                   REAL*8 :: DXRHO, DYRHO
                   REAL*8 :: R
                   REAL*8 :: DSQVX, DX2VX, DY2VX
                   REAL*8 :: DSQVY, DX2VY, DY2VY
       CHARACTER(LEN=100) :: X1, FMT

       OPEN(UNIT=200,FILE='x_y_r_dxr_dyr_vx_vy_g2vx_g2vy_allproc')

       FMT='(i2.2)'
       DO IPROC = 1, NPROC

       WRITE(X1,FMT) IPROC-1
       OPEN(UNIT=100,FILE='data/linconfig/densvelfield'//TRIM(X1))
       DO I = 1, N
       DO J = 1, N
       READ(100,*) X(I,J), Y(I,J), DRHO(I,J), VX(I,J), VY(I,J)
       RHO(I,J) = RHO0 + DRHO(I,J)
       ENDDO !J
       ENDDO !I
       CLOSE(100)

       DO I = 1, N
       IP1 = I + 1
       IF(I.EQ.N) IP1 = 1
       IM1 = I - 1
       IF(I.EQ.1) IM1 = N
       DO J = 1, N
       JP1 = J + 1
       IF(J.EQ.N) JP1 = 1
       JM1 = J - 1
       IF(J.EQ.1) JM1 = N

       IF(Y(I,J).GT.7.D0.AND.Y(I,J).LE.8.D0) THEN
       DXRHO = (RHO(IP1,J) - RHO(IM1,J))/(2.D0*DX)
       DYRHO = (RHO(I,JP1) - RHO(I,JM1))/(2.D0*DX)
       DX2VX = (VX(IP1,J) + VX(IM1,J) - (2.D0*VX(I,J)))/(DX*DX)
       DY2VX = (VX(I,JP1) + VX(I,JM1) - (2.D0*VX(I,J)))/(DY*DY)
       DSQVX = DX2VX + DY2VX
       DX2VY = (VY(IP1,J) + VY(IM1,J) - (2.D0*VY(I,J)))/(DX*DX)
       DY2VY = (VY(I,JP1) + VY(I,JM1) - (2.D0*VY(I,J)))/(DY*DY)
       DSQVY = DX2VY + DY2VY
       WRITE(200,*) X(I,J), Y(I,J), RHO(I,J), DXRHO, DYRHO, &
       VX(I,J), VY(I,J), DSQVX, DSQVY
       ENDIF

       ENDDO !J
       ENDDO !I 

       ENDDO !IPROC

       CLOSE(200)

       STOP
       END PROGRAM DERIVATIVES
