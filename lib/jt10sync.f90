! This source code file was last time modified by Igor UA3DJY on April 12th, 2017
! All changes are shown in the patch file coming together with the full JTDX source code.

  integer ii(16)                       !Locations of sync symbols
  data ii/ 1,2,5,10,16,23,33,35,51,52,55,60,66,73,83,85/

  integer ii2(16)                      !Locations of sync half-symbols
  data ii2/1,3,9,19,31,45,65,69,101,103,109,119,131,145,165,169/

  integer ka(16),kb(16)                !Reference symbols for sync
  data ka/5,5,11,21,33,47,63,71,97,105,111,121,133,147,159,163/
  data kb/7,7,13,23,35,49,67,73,99,107,113,123,135,149,161,167/


  integer isync(85)                    !Sync vector
  data isync/                                     &
       1,2,0,0,1,0,0,0,0,2,0,0,0,0,0,1,0,0,0,0,   &
       0,0,2,0,0,0,0,0,0,0,0,0,1,0,2,0,0,0,0,0,   &
       0,0,0,0,0,0,0,0,0,0,2,1,0,0,2,0,0,0,0,1,   &
       0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,   &
       0,0,2,0,1/

  logical(1) lsync(16)
  data lsync/                                                        &
        .true.,.false.,.true.,.false.,.true.,.false.,.true.,.false., &
        .false.,.true.,.false.,.true.,.false.,.true.,.false.,.true./