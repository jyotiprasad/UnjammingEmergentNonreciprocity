       SUBROUTINE FLUSHKOB(IOUNIT)

       IMPLICIT DOUBLE PRECISION (A-H,O-Z)
       CHARACTER*1 CHARA

       ENDFILE IOUNIT
       REWIND IOUNIT
10     READ (IOUNIT,FMT='(A)', END=40) CHARA
       GOTO 10
40     RETURN
       END SUBROUTINE FLUSHKOB

