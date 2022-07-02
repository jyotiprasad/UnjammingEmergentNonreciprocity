       SUBROUTINE SORT(N,ARR)

       INTEGER N,M,NSTACK
       INTEGER ARR(N),A,TEMP
       PARAMETER (M=7,NSTACK=50)
       INTEGER I,IR,J,JSTACK,K,L,ISTACK(NSTACK)

       JSTACK=0
       L=1
       IR=N
1      IF(IR-L.LT.M)THEN
       DO 12 J=L+1,IR
          A=ARR(J)
          DO 11 I=J-1,1,-1
            IF(ARR(I).LE.A)GOTO 2
            ARR(I+1)=ARR(I)
11        CONTINUE
          I=0
2         ARR(I+1)=A
12     CONTINUE
       IF(JSTACK.EQ.0)RETURN
         IR=ISTACK(JSTACK)
         L=ISTACK(JSTACK-1)
         JSTACK=JSTACK-2
       ELSE
         K=(L+IR)/2
         TEMP=ARR(K)
         ARR(K)=ARR(L+1)
         ARR(L+1)=TEMP
         IF(ARR(L+1).GT.ARR(IR))THEN
           TEMP=ARR(L+1)
           ARR(L+1)=ARR(IR)
           ARR(IR)=TEMP
         ENDIF
         IF(ARR(L).GT.ARR(IR))THEN
           TEMP=ARR(L)
           ARR(L)=ARR(IR)
           ARR(IR)=TEMP
         ENDIF
         IF(ARR(L+1).GT.ARR(L))THEN
           TEMP=ARR(L+1)
           ARR(L+1)=ARR(L)
           ARR(L)=TEMP
         ENDIF
         I=L+1
         J=IR
         A=ARR(L)
3       CONTINUE
          I=I+1
        IF(ARR(I).LT.A)GOTO 3
4       CONTINUE
        J=J-1
        IF(ARR(J).GT.A)GOTO 4
        IF(J.LT.I)GOTO 5
        TEMP=ARR(I)
        ARR(I)=ARR(J)
        ARR(J)=TEMP
        GOTO 3
5       ARR(L)=ARR(J)
        ARR(J)=A
        JSTACK=JSTACK+2
        IF(JSTACK.GT.NSTACK)STOP 'NSTACK TOO SMALL IN SORT'
        IF(IR-I+1.GE.J-L)THEN
          ISTACK(JSTACK)=IR
          ISTACK(JSTACK-1)=I
          IR=J-1
        ELSE
          ISTACK(JSTACK)=J-1
          ISTACK(JSTACK-1)=L
          L=I
        ENDIF
      ENDIF
      GOTO 1
      END SUBROUTINE SORT
