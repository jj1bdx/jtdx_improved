subroutine morse(msg,idat,n)

! Convert ascii message to a Morse code bit string.
!    Dash = 3 dots
!    Space between dots, dashes = 1 dot
!    Space between letters = 3 dots
!    Space between words = 7 dots

  character*(*) msg
  integer idat(250)
  integer*1 ic(21,38)
  data ic/                                        &
     1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,20,  &
     1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,0,0,18,  &
     1,0,1,0,1,1,1,0,1,1,1,0,1,1,1,0,0,0,0,0,16,  &
     1,0,1,0,1,0,1,1,1,0,1,1,1,0,0,0,0,0,0,0,14,  &
     1,0,1,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,12,  &
     1,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,10,  &
     1,1,1,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,12,  &
     1,1,1,0,1,1,1,0,1,0,1,0,1,0,0,0,0,0,0,0,14,  &
     1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,0,0,0,0,0,16,  &
     1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,0,0,0,18,  &
     1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 6,  &
     1,1,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,10,  &
     1,1,1,0,1,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,12,  &
     1,1,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0, 8,  &
     1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 2,  &
     1,0,1,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,10,  &
     1,1,1,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,10,  &
     1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0, 8,  &
     1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 4,  &
     1,0,1,1,1,0,1,1,1,0,1,1,1,0,0,0,0,0,0,0,14,  &
     1,1,1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,10,  &
     1,0,1,1,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,10,  &
     1,1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0, 8,  &
     1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 6,  &
     1,1,1,0,1,1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,12,  &
     1,0,1,1,1,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,12,  &
     1,1,1,0,1,1,1,0,1,0,1,1,1,0,0,0,0,0,0,0,14,  &
     1,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0, 8,  &
     1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 6,  &
     1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 4,  &
     1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0, 8,  &
     1,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,10,  &
     1,0,1,1,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,10,  &
     1,1,1,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,12,  &
     1,1,1,0,1,0,1,1,1,0,1,1,1,0,0,0,0,0,0,0,14,  &
     1,1,1,0,1,1,1,0,1,0,1,0,0,0,0,0,0,0,0,0,12,  &
     1,1,1,0,1,0,1,0,1,1,1,0,1,0,0,0,0,0,0,0,14,  &
     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 2/     !Incremental word space
  save

  msglen=len(msg)
  idat=0
  n=6
  do k=1,msglen
     jj=ichar(msg(k:k))
     if(jj.ge.97 .and. jj.le.122) jj=jj-32  !Convert lower to upper case
     if(jj.ge.48 .and. jj.le.57) j=jj-48    !Numbers
     if(jj.ge.65 .and. jj.le.90) j=jj-55    !Letters
     if(jj.eq.47) j=36                      !Slash (/)
     if(jj.eq.32) j=37                      !Word space
     j=j+1

! Insert this character
     nmax=ic(21,j)
     do i=1,nmax
        n=n+1
        idat(n)=ic(i,j)
     enddo

! Insert character space of 2 dit lengths:
     n=n+1
     idat(n)=0
     n=n+1
     idat(n)=0
  enddo

! Insert word space at end of message
  do j=1,4
     n=n+1
     idat(n)=0
  enddo

  return
end subroutine morse
