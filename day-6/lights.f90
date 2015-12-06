program lights

implicit none

logical, dimension(1000,1000) :: lightsArray
integer, dimension(1000,1000) :: brightness

character(32) :: line

! internals
integer :: code, action, i, j
! sPos = starting position tPos = through position, fcPost = first comma position, scPost = second comma position
integer :: sPos, tPos, fcPos, scPos
! positions
integer :: fromX, fromY, toX, toY
! result
integer :: number = 0, totalBrightness = 0

do i=1,1000
	do j=1,1000
		brightness(i,j)=0
	end do
end do

do
	read(*,'(A)',iostat=code) line

	!EOF?
	if (code<0) then
		exit
	end if

	fcPos = index(line,',')
	scPos = index(line(fcPos+1:),',')+fcPos+1
	tPos = index(line,"through")

	if (index(line,"toggle")>0) then
		action = 0 !toggle +2
		sPos = 7
	else if (index(line, "turn on")>0) then
		action = 1 !turn on +1
		sPos = 8
	else
		action = 2 !turn off -1
		sPos = 9
	end if

	! string to int
	read(line(sPos:fcPos-1),*) fromX
	read(line(fcPos+1:tPos-1),*) fromY
	read(line(tPos+8:scPos-1),*) toX
	read(line(scPos:),*) toY

	do i = fromX+1,toX+1
		do j = fromY+1, toY+1
			if (action==0) then
				lightsArray(i,j) = .NOT.lightsArray(i,j)
				brightness(i,j) = brightness(i,j)+2
			else if (action==1) then
				lightsArray(i,j) = .TRUE.
				brightness(i,j) = brightness(i,j)+1
			else
				lightsArray(i,j) = .FALSE.
				brightness(i,j) = brightness(i,j)-1
				! minimal is 0
				if (brightness(i,j) < 0) then
					brightness(i,j) = 0
				end if
			end if
		end do
	end do
end do


do i = 1,1000
	do j = 1,1000
		totalBrightness = totalBrightness+brightness(i,j)
		if (lightsArray(i,j)) then
			number = number + 1
		end if
	end do
end do

write(*,*) "Lamps on:", number
write(*,*) "Total brightness:", totalBrightness

end program lights
