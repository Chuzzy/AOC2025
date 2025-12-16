program main
  implicit none
  character(len=100), allocatable :: input (:)
  integer :: res

  allocate(input(200))

  open(67, file="input.txt", status="old", action="read")
  read(67, fmt='(A100)') input
  close(67)

  res = part1(input)
  print *, res
contains

  function part1(input) result(total)
    implicit none

    character(len=100), intent(in) :: input(:)
    integer :: total, maximum, i, j, k, first_digit, second_digit, current

    total = 0
    do i = 1, size(input)
      maximum = 0

      do j = 1, 100
        first_digit = ichar(input(i)(j:j)) - ichar('0')

        do k = j + 1, 100
          second_digit = ichar(input(i)(k:k)) - ichar('0')
          
          current = first_digit * 10 + second_digit

          if (current > maximum) maximum = current
        end do
      end do

      total = total + maximum
    end do
  end function part1

end program main

