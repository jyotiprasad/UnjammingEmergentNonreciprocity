      subroutine sysupdate
      use mod_param
      implicit none

      call posup
      call thetaup
      call force

      end subroutine sysupdate
