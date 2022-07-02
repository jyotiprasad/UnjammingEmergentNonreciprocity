       PROGRAM place_C

       IMPLICIT NONE
       INTEGER, PARAMETER :: N = 5040, NC = 2, NPROC = 256
        REAL*8, PARAMETER :: L0 = 9.0D1, dxi = 20.0D0

        CHARACTER(LEN=80) :: FNAME1, FNAME2, FOUT1, FOUT2
                  INTEGER :: PT(1:N)
                   REAL*8 :: X(1:N), Y(1:N)
                   REAL*8 :: XC0(1:NC), YC0(1:NC)
                  INTEGER :: I, J, K, L, M
                  INTEGER :: JC(1:NC), INDXC, JC0 
                   REAL*8 :: RX, RY, RSQ(1:N)
                  INTEGER :: DUMPT

       XC0(1) = -(L0/2.D0) + 1.D0 + dxi; YC0(1) = 0.0D0
       XC0(2) = -(L0/2.D0) + 1.D0; YC0(2) = 0.0D0
       
       DO K = 1, NPROC

       !!!!!    READING TYPE OF THE PARTICLES    !!!!!
       WRITE(FNAME1,'("data/input/particle",I3.3)') K-1
       OPEN(UNIT=100,FILE=TRIM(FNAME1),STATUS='UNKNOWN')
       INDXC = 0
       DO J = 1, N
       READ(100,*) PT(J)
       ENDDO !J
       CLOSE(100)
       !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!     

       !!!!!    READING THE INPUT COORDINATES    !!!!!
       WRITE(FNAME2,'("data/input/position",I3.3)') K-1
       OPEN(UNIT=200,FILE=TRIM(FNAME2),STATUS='UNKNOWN')
       DO J = 1, N
       READ(200,*) X(J), Y(J)
       ENDDO !J
       CLOSE(200)
       !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!       
       
       DO M = 1, NC
       DO J = 1, N
       RX = X(J) - XC0(M)
       RY = Y(J) - YC0(M)
       RX = RX - L0*ANINT(RX/L0)
       RY = RY - L0*ANINT(RY/L0)
       RSQ(J) = RX*RX + RY*RY
       ENDDO !J
       JC0 = MINLOC(RSQ,1)  
       PT(JC0) = 3
       ENDDO !M

       !!!!!     WRITING COORDINATES AND TYPES    !!!!!
       WRITE(FOUT1,'("data/input/particle",I3.3)') K-1
       OPEN(UNIT=300,FILE=TRIM(FOUT1),STATUS='UNKNOWN')
       DO J = 1, N
       WRITE(300,*) PT(J)
       ENDDO !J   

       CLOSE(300)

       ENDDO !K

       STOP
       END PROGRAM place_C  
