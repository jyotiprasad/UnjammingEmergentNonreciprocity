       PROGRAM ANALYSES
       IMPLICIT NONE
      
       INTEGER, PARAMETER :: NFRAME = 2500!250
       INTEGER, PARAMETER :: NPROC = 256
       INTEGER, PARAMETER :: N = 5040
       INTEGER, PARAMETER :: NC = 2
        REAL*8, PARAMETER :: L0 = 9.0D1
        REAL*8, PARAMETER :: DT = 1.D0
                  INTEGER :: IPROC, IFRAME, J
                  INTEGER :: PT, NCOUNT
                   REAL*8 :: DUMX, DUMY, X0(1:NC), Y0(1:NC)
                   REAL*8 :: DX0, DY0
                   REAL*8 :: X1(1:NFRAME), Y1(1:NFRAME)
                   REAL*8 :: X2(1:NFRAME), Y2(1:NFRAME)
                   REAL*8 :: XDUM(1:NFRAME), YDUM(1:NFRAME)
                   REAL*8 :: DX(1:NFRAME), DY(1:NFRAME)
                   REAL*8 :: AVDX0, AVDY0, AVSQDX0, AVSQDY0
                   REAL*8 :: ERDX0, ERDY0
                   REAL*8 :: MAVDX, MERDX
                   REAL*8 :: AVX1(1:NFRAME), AVX2(1:NFRAME)
                   REAL*8 :: AVY1(1:NFRAME), AVY2(1:NFRAME)
                   REAL*8 :: AVSQX1(1:NFRAME), AVSQX2(1:NFRAME)
                   REAL*8 :: AVSQY1(1:NFRAME), AVSQY2(1:NFRAME)
                   REAL*8 :: ERX1(1:NFRAME), ERX2(1:NFRAME)
                   REAL*8 :: ERY1(1:NFRAME), ERY2(1:NFRAME)
                   REAL*8 :: AVDX(1:NFRAME), AVDY(1:NFRAME)
                   REAL*8 :: AVSQDX(1:NFRAME), AVSQDY(1:NFRAME)
                   REAL*8 :: ERDX(1:NFRAME), ERDY(1:NFRAME)
                   REAL*8 :: VX1(1:NFRAME), VX2(1:NFRAME)
                   REAL*8 :: VY1(1:NFRAME), VY2(1:NFRAME)
                   REAL*8 :: V1(1:NFRAME), V2(1:NFRAME)
                   REAL*8 :: AVVX1, AVVY1, AVV1, AVVX2, AVVY2, AVV2
                   REAL*8 :: AVSQVX1, AVSQVX2, AVSQVY1, AVSQVY2
                   REAL*8 :: ERVX1, ERVX2, ERVY1, ERVY2
       CHARACTER(LEN=144) :: NODEID, FMT

       AVX1 = 0.D0; AVY1 = 0.D0
       AVX2 = 0.D0; AVY2 = 0.D0
       AVSQX1 = 0.D0; AVSQY1 = 0.D0
       AVSQX2 = 0.D0; AVSQY2 = 0.D0

       AVDX0 = 0.D0; AVDY0 = 0.D0      
       AVSQDX0 = 0.D0; AVSQDY0 = 0.D0
       ERDX0 = 0.D0; ERDY0 = 0.D0

       AVDX = 0.D0; AVDY = 0.D0
       AVSQDX = 0.D0; AVSQDY = 0.D0
       ERDX = 0.D0; ERDY = 0.D0

       AVVX1 = 0.D0; AVVY1 = 0.D0
       AVSQVX1 = 0.D0; AVSQVY1 = 0.D0
       AVVX2 = 0.D0; AVVY2 = 0.D0
       AVSQVX2 = 0.D0; AVSQVY2 = 0.D0

       DO IPROC = 1, NPROC
 
       FMT='(i3.3)'
       WRITE(NODEID,FMT) (IPROC-1)

       OPEN(UNIT=099,FILE='data/input/particle'//TRIM(NODEID))
       OPEN(UNIT=100,FILE='data/input/position'//TRIM(NODEID))
       NCOUNT = 0
       DO J = 1, N
       READ(099,*) PT
       READ(100,*) DUMX, DUMY
       IF(PT.EQ.3) THEN
       NCOUNT = NCOUNT + 1
       X0(NCOUNT) = DUMX
       Y0(NCOUNT) = DUMY
       ENDIF       
       ENDDO !J
       DUMX = 0.D0; DUMY = 0.D0
       CLOSE(099); CLOSE(100)

       IF(X0(1).LT.X0(2)) THEN
       DUMX = X0(1)
       X0(1) = X0(2)
       X0(2) = DUMX
       DUMY = Y0(1)
       Y0(1) = Y0(2)
       Y0(2) = DUMY              
       ENDIF       

       DX0 = X0(1) - X0(2)
       DY0 = Y0(1) - Y0(2)
       AVDX0 = AVDX0 + DX0
       AVDY0 = AVDY0 + DY0
       AVSQDX0 = AVSQDX0 + DX0*DX0
       AVSQDY0 = AVSQDY0 + DY0*DY0
       
       OPEN(UNIT=101,FILE='data/linconfig/conf'//TRIM(NODEID))
       DO IFRAME = 1, NFRAME
       READ(101,*) X1(IFRAME), Y1(IFRAME)
       READ(101,*) X2(IFRAME), Y2(IFRAME)
       ENDDO !IFRAME
       CLOSE(101)

       IF(X1(1).LT.X2(1)) THEN
       XDUM = X1
       X1 = X2
       X2 = XDUM
       YDUM = Y1
       Y1 = Y2
       Y2 = YDUM
       ENDIF

       AVX1 = AVX1 + X1
       AVX2 = AVX2 + X2
       AVY1 = AVY1 + Y1
       AVY2 = AVY2 + Y2
       AVSQX1 = AVSQX1 + X1*X1
       AVSQX2 = AVSQX2 + X2*X2
       AVSQY1 = AVSQY1 + Y1*Y1
       AVSQY2 = AVSQY2 + Y2*Y2

       DX = X1 - X2
       DY = Y1 - Y2
       !DX = DX - L0*ANINT(DX/L0)
       !DY = DY - L0*ANINT(DY/L0)
       AVDX = AVDX + DX
       AVDY = AVDY + DY
       AVSQDX = AVSQDX + DX*DX
       AVSQDY = AVSQDY + DY*DY

       VX1(1) = X1(1) - X0(1)
       VX2(1) = X2(1) - X0(2)
       VY1(1) = Y1(1) - Y0(1)
       VY2(1) = Y2(1) - Y0(2)
       V1(1) = DSQRT(VX1(1)*VX1(1) + VY1(1)*VY1(1))
       V2(1) = DSQRT(VX2(1)*VX2(1) + VY2(1)*VY2(1))
       DO IFRAME = 2, NFRAME
       VX1(IFRAME) = X1(IFRAME) - X1(IFRAME-1)
       !VX1(IFRAME) = VX1(IFRAME) - L0*ANINT(VX1(IFRAME)/L0)
       VX1(IFRAME) = VX1(IFRAME)/DT
       VX2(IFRAME) = X2(IFRAME) - X2(IFRAME-1)
       !VX2(IFRAME) = VX2(IFRAME) - L0*ANINT(VX2(IFRAME)/L0)
       VX2(IFRAME) = VX2(IFRAME)/DT
       VY1(IFRAME) = Y1(IFRAME) - Y1(IFRAME-1)
       !VY1(IFRAME) = VY1(IFRAME) - L0*ANINT(VY1(IFRAME)/L0)
       VY1(IFRAME) = VY1(IFRAME)/DT
       VY2(IFRAME) = Y2(IFRAME) - Y2(IFRAME-1)
       !VY2(IFRAME) = VY2(IFRAME) - L0*ANINT(VY2(IFRAME)/L0)
       VY2(IFRAME) = VY2(IFRAME)/DT
       V1(IFRAME) = DSQRT(VX1(IFRAME)*VX1(IFRAME) + &
       VY1(IFRAME)*VY1(IFRAME))
       V2(IFRAME) = DSQRT(VX2(IFRAME)*VX2(IFRAME) + &
       VY2(IFRAME)*VY2(IFRAME))
       ENDDO !IFRAME

       AVVX1 = AVVX1 + SUM(VX1(31:90))/(1.D0*60.D0) !SUM(VX1)/(1.D0*NFRAME)
       AVVX2 = AVVX2 + SUM(VX2(31:90))/(1.D0*60.D0)
       AVSQVX1 = AVSQVX1 + (SUM(VX1(31:90))*SUM(VX1(31:90)))/(60*60.D0)
       AVSQVX2 = AVSQVX2 + (SUM(VX2(31:90))*SUM(VX2(31:90)))/(60*60.D0)
       AVVY1 = AVVY1 + SUM(VY1(31:90))/(1.D0*60.D0)
       AVVY2 = AVVY2 + SUM(VY2(31:90))/(1.D0*60.D0)
       AVSQVY1 = AVSQVY1 + (SUM(VY1(31:90))*SUM(VY1(31:90)))/(60*60.D0)
       AVSQVY2 = AVSQVY2 + (SUM(VY2(31:90))*SUM(VY2(31:90)))/(60*60.D0)
       AVV1 = AVV1 + SUM(V1(31:90))/(1.D0*60.D0)
       AVV2 = AVV2 + SUM(V2(31:90))/(1.D0*60.D0)
       ENDDO !IPROC

       AVX1 = AVX1/(1.D0*NPROC)
       AVX2 = AVX2/(1.D0*NPROC)
       AVY1 = AVY1/(1.D0*NPROC)
       AVY2 = AVY2/(1.D0*NPROC)
       AVSQX1 = AVSQX1/(1.D0*NPROC)
       AVSQX2 = AVSQX2/(1.D0*NPROC)
       AVSQY1 = AVSQY1/(1.D0*NPROC)
       AVSQY2 = AVSQY2/(1.D0*NPROC)
       ERX1 = DSQRT((AVSQX1 - (AVX1*AVX1))/(1.D0*NPROC))
       ERX2 = DSQRT((AVSQX2 - (AVX2*AVX2))/(1.D0*NPROC))
       ERY1 = DSQRT((AVSQY1 - (AVY1*AVY1))/(1.D0*NPROC))
       ERY2 = DSQRT((AVSQY2 - (AVY2*AVY2))/(1.D0*NPROC))

       OPEN(UNIT=203,FILE='data/linconfig/mean_traj')
       DO IFRAME = 1, NFRAME
       WRITE(203,*) AVX1(IFRAME), AVY1(IFRAME), AVX2(IFRAME), &
       AVY2(IFRAME), ERX1(IFRAME), ERY1(IFRAME), ERX2(IFRAME), &
       ERY2(IFRAME)
       ENDDO !IFRAME
       CLOSE(203)       

       AVDX0 = AVDX0/(1.D0*NPROC)
       AVDY0 = AVDY0/(1.D0*NPROC)
       AVSQDX0 = AVSQDX0/(1.D0*NPROC)
       AVSQDY0 = AVSQDY0/(1.D0*NPROC)
       ERDX0 = DSQRT((AVSQDX0 - (AVDX0*AVDX0))/(1.D0*NPROC))
       ERDY0 = DSQRT((AVSQDY0 - (AVDY0*AVDY0))/(1.D0*NPROC))

       AVDX = AVDX/(1.D0*NPROC)
       AVDY = AVDY/(1.D0*NPROC)
       AVSQDX = AVSQDX/(1.D0*NPROC)
       AVSQDY = AVSQDY/(1.D0*NPROC)
       ERDX = DSQRT((AVSQDX - (AVDX*AVDX))/(1.D0*NPROC))
       ERDY = DSQRT((AVSQDY - (AVDY*AVDY))/(1.D0*NPROC))       

       OPEN(UNIT=201,FILE='data/linconfig/d0_dx_errs')
       OPEN(UNIT=200,FILE='data/linconfig/t_dx_dy_errs')
       WRITE(200,*) 0.D0, AVDX0, AVDY0, ERDX0, ERDY0
       DO IFRAME = 1, NFRAME
       IF(AVX1(IFRAME).GT.(0.5D0*L0).OR.AVX2(IFRAME).GT.(0.5D0*L0)) THEN
       MAVDX = SUM(AVDX((IFRAME-5):(IFRAME-1)))/5.D0
       MERDX = SUM(ERDX((IFRAME-5):(IFRAME-1)))/5.D0
       WRITE(201,*) AVDX0, MAVDX, ERDX0, MERDX
       !WRITE(201,*) AVDX0, AVDX(IFRAME-1), ERDX0, ERDX(IFRAME-1) 
       !!!GOTO 20
       !!!ELSE
       ENDIF
       WRITE(200,*) 1.D0*IFRAME, AVDX(IFRAME), AVDY(IFRAME), &
       ERDX(IFRAME), ERDY(IFRAME)
       !!!ENDIF
       ENDDO !IFRAME
 20    CLOSE(200)
       CLOSE(201)

       AVVX1 = AVVX1/(1.D0*NPROC)
       AVVX2 = AVVX2/(1.D0*NPROC)
       AVSQVX1 = AVSQVX1/(1.D0*NPROC)
       AVSQVX2 = AVSQVX2/(1.D0*NPROC)
       ERVX1 = DSQRT((AVSQVX1 - (AVVX1*AVVX1))/(1.D0*NPROC))
       ERVX2 = DSQRT((AVSQVX2 - (AVVX2*AVVX2))/(1.D0*NPROC))
       AVVY1 = AVVY1/(1.D0*NPROC)
       AVVY2 = AVVY2/(1.D0*NPROC)
       AVSQVY1 = AVSQVY1/(1.D0*NPROC)
       AVSQVY2 = AVSQVY2/(1.D0*NPROC)
       ERVY1 = DSQRT((AVSQVY1 - (AVVY1*AVVY1))/(1.D0*NPROC))
       ERVY2 = DSQRT((AVSQVY2 - (AVVY2*AVVY2))/(1.D0*NPROC))
       AVV1 = AVV1/(1.D0*NPROC)
       AVV2 = AVV2/(1.D0*NPROC)

       OPEN(UNIT=202,FILE='data/linconfig/dx0_vx1_vy1_vx2_vy2_errs')
       WRITE(202,*) AVDX0, AVVX1, AVVY1, AVVX2, AVVY2, ERVX1, ERVY1, &
       ERVX2, ERVY2
       CLOSE(202)

       STOP
       END PROGRAM ANALYSES
