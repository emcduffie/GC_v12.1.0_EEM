!------------------------------------------------------------------------------
!                  GEOS-Chem Global Chemical Transport Model                  !
!------------------------------------------------------------------------------
!BOP
!
! !IROUTINE: get_met_mod.F90
!
! !DESCRIPTION: Module GET\_MET\_MOD contains variables and routines for 
!  reading the meteorological data, from the HEMCO data structure.
!\\
!\\
! !INTERFACE:

MODULE Get_Met_Mod
!
! !USES:
!
  USE Precision_Mod    ! For GEOS-Chem Precision (fp)
  USE CMN_SIZE_MOD     ! Size parameters

  IMPLICIT NONE
!
! !PUBLIC MEMBER FUNCTIONS:
!
  PUBLIC :: Get_Met_2D
  PUBLIC :: Get_Met_3D
  PUBLIC :: Get_Met_3De
!
! !REMARKS:
!
! !REVISION HISTORY:
!  04 Mar 2016 - J.W.Zhuang - Initial version
!EOP
!------------------------------------------------------------------------------
!BOC
CONTAINS
!EOC
!------------------------------------------------------------------------------
!                  GEOS-Chem Global Chemical Transport Model                  !
!------------------------------------------------------------------------------
!BOP
!
! !IROUTINE: Get_Met_2D
!
! !DESCRIPTION: Copies the 2D met data from the HEMCO data structure
!\\
!\\
! !INTERFACE:
!
  SUBROUTINE Get_Met_2D( Q, v_name, t_index )
!
! !USES:
!
    USE ErrCode_Mod
    USE Error_Mod,          ONLY : Error_Stop
    USE HCO_INTERFACE_MOD,  ONLY : HcoState
    USE HCO_EmisList_Mod,   ONLY : HCO_GetPtr 
!
!
! !INPUT PARAMETERS:
!
    CHARACTER(LEN=*),INTENT(IN)            :: v_name    ! netCDF variable name
    INTEGER,         INTENT(IN), OPTIONAL  :: t_index   ! Time index (default=1)
!
! !OUTPUT PARAMETERS:
!
    REAL*4,          INTENT(OUT)           :: Q(IIPAR,JJPAR) ! Temporary
                                                             ! data array
!
! !REVISION HISTORY:
!  04 Mar 2016 - J.W.Zhuang  - Initial version
!  03 Oct 2018 - M. Sulprizio- Add time index as input argument
!EOP
!------------------------------------------------------------------------------
!BOC
!
! !LOCAL VARIABLES:
!   
    ! Scalars
    INTEGER :: T
    LOGICAL :: FND
    LOGICAL :: am_I_Root   ! Are we on the root CPU?
    INTEGER :: RC          ! Success or failure?

    ! Pointers
    REAL(f4), POINTER :: Ptr2D(:,:)

    !=======================================================================
    ! Get_Met_2D begins here!
    !=======================================================================

    ! Assume success
    RC = GC_SUCCESS

    ! Nullify pointer
    Ptr2D => NULL()

    ! Define time index to use
    IF ( PRESENT(t_index) ) THEN
       T = t_index
    ELSE
       T = 1
    ENDIF

    ! Get the pointer to the data in the HEMCO data structure
    CALL HCO_GetPtr( am_I_Root, HcoState, v_name, Ptr2D, RC, TIDX=T, &
                     FOUND=FND )

      ! Stop with error message
    IF ( RC /= GC_SUCCESS .or. ( .not. FND ) ) THEN
       CALL ERROR_STOP (trim('Could not find '//v_name//' in HEMCO data list!'), & 
                         'GET_MET_2D (get_met_mod.F90)' )
    ENDIF

    ! transfer to output array
    Q = Ptr2D(:,:) 

    ! Free the pointer
    Ptr2D => NULL()

  END SUBROUTINE Get_Met_2D
!EOC
!------------------------------------------------------------------------------
!                  GEOS-Chem Global Chemical Transport Model                  !
!------------------------------------------------------------------------------
!BOP
!
! !IROUTINE: Get_Met_3D
!
! !DESCRIPTION: Copies the 3D met data from the HEMCO data structure
!\\
!\\
! !INTERFACE:
!
  SUBROUTINE Get_Met_3D( Q, v_name, t_index )
!
! !USES:
!
    USE ErrCode_Mod
    USE Error_Mod,          ONLY : Error_Stop
    USE HCO_INTERFACE_MOD,  ONLY : HcoState
    USE HCO_EmisList_Mod,   ONLY : HCO_GetPtr 
!
!
! !INPUT PARAMETERS:
!
    CHARACTER(LEN=*),INTENT(IN)            :: v_name    ! netCDF variable name
    INTEGER,         INTENT(IN), OPTIONAL  :: t_index   ! Time index (default=1)
!
! !OUTPUT PARAMETERS:
!
    REAL*4,          INTENT(OUT)           :: Q(IIPAR,JJPAR,LLPAR) ! Temporary
                                                                   ! data array
!
! !REVISION HISTORY:
!  04 Mar 2016 - J.W.Zhuang  - Initial version
!  03 Oct 2018 - M. Sulprizio- Add time index as input argument
!EOP
!------------------------------------------------------------------------------
!BOC
!
! !LOCAL VARIABLES:
!   
    ! Scalars
    INTEGER :: T
    LOGICAL :: FND
    LOGICAL :: am_I_Root   ! Are we on the root CPU?
    INTEGER :: RC          ! Success or failure?

    ! Pointers
    REAL(f4), POINTER :: Ptr3D(:,:,:)

    !=======================================================================
    ! Get_Met_3D begins here!
    !=======================================================================

    ! Assume success
    RC = GC_SUCCESS

    ! Nullify pointer
    Ptr3D => NULL()

    ! Define time index to use
    IF ( PRESENT(t_index) ) THEN
       T = t_index
    ELSE
       T = 1
    ENDIF
    
    ! Get the pointer to the data in the HEMCO data structure
    CALL HCO_GetPtr( am_I_Root, HcoState, v_name, Ptr3D, RC, TIDX=T, &
                     FOUND=FND )

      ! Stop with error message
    IF ( RC /= GC_SUCCESS .or. ( .not. FND ) ) THEN
       CALL ERROR_STOP (trim('Could not find '//v_name//' in HEMCO data list!'), & 
                         'GET_MET_3D(get_met_mod.F90)' )
    ENDIF

    ! transfer to output array
    Q = Ptr3D(:,:,:) 

    ! Free the pointer
    Ptr3D => NULL()

  END SUBROUTINE Get_Met_3D
!EOC
!------------------------------------------------------------------------------
!                  GEOS-Chem Global Chemical Transport Model                  !
!------------------------------------------------------------------------------
!BOP
!
! !IROUTINE: Get_Met_3De
!
! !DESCRIPTION: Copies the 3D met data on edges from the HEMCO data structure
!\\
!\\
! !INTERFACE:
!
  SUBROUTINE Get_Met_3De( Q, v_name, t_index )
!
! !USES:
!
    USE ErrCode_Mod
    USE Error_Mod,          ONLY : Error_Stop
    USE HCO_INTERFACE_MOD,  ONLY : HcoState
    USE HCO_EmisList_Mod,   ONLY : HCO_GetPtr 
!
!
! !INPUT PARAMETERS:
!
    CHARACTER(LEN=*),INTENT(IN)            :: v_name    ! netCDF variable name
    INTEGER,         INTENT(IN), OPTIONAL  :: t_index   ! Time index (default=1)
!
! !OUTPUT PARAMETERS:
!
    REAL*4,          INTENT(OUT)           :: Q(IIPAR,JJPAR,LLPAR+1)! Temporary
                                                                    ! data array
!
! !REVISION HISTORY:
!  04 Mar 2016 - J.W.Zhuang  - Initial version
!  03 Oct 2018 - M. Sulprizio- Add time index as input argument
!EOP
!------------------------------------------------------------------------------
!BOC
!
! !LOCAL VARIABLES:
!   
    ! Scalars
    INTEGER :: T
    LOGICAL :: FND
    LOGICAL :: am_I_Root   ! Are we on the root CPU?
    INTEGER :: RC          ! Success or failure?

    ! Pointers
    REAL(f4), POINTER :: Ptr3D(:,:,:)

    !=======================================================================
    ! Get_Met_3De begins here!
    !=======================================================================

    ! Assume success
    RC = GC_SUCCESS

    ! Nullify pointer
    Ptr3D => NULL()

    ! Define time index to use
    IF ( PRESENT(t_index) ) THEN
       T = t_index
    ELSE
       T = 1
    ENDIF

    ! Get the pointer to the data in the HEMCO data structure
    CALL HCO_GetPtr( am_I_Root, HcoState, v_name, Ptr3D, RC, TIDX=T, &
                     FOUND=FND )

      ! Stop with error message
    IF ( RC /= GC_SUCCESS .or. ( .not. FND ) ) THEN
       CALL ERROR_STOP (trim('Could not find '//v_name//' in HEMCO data list!'), & 
                         'GET_MET_3De(get_met_mod.F90)' )
    ENDIF

    ! transfer to output array
    Q = Ptr3D(:,:,:) 

    ! Free the pointer
    Ptr3D => NULL()

  END SUBROUTINE Get_Met_3De
!EOC
END MODULE Get_Met_Mod
