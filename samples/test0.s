# Generated by c.py
# Atul Varma (Spring 2004)

    .text

# BEGIN FUNCTION: main() -----------------------------------------------
#
# Function type: function()->int

    .global _main
_main:
  pushl %ebp                        # Save old frame pointer
  movl %esp, %ebp                   # Set new frame pointer
  subl $20, %esp                    # Allocate space for local+temp vars
  leal -4(%ebp), %edx               # Get address of a
  movl $0, (%edx)                   # Perform assignment '='
  movl (%edx), %ecx                 # Copy assignment result to register

  # FUNCTION CALL to printf() - begin

  movl $LC0, %ecx                   # Get addr of string literal 'Please ...'
  pushl %ecx                        # Push arg 1
  call _printf                      # Call printf()
  addl $4, %esp                     # Deallocate argument stack

  # FUNCTION CALL to printf() - end

  leal -16(%ebp), %eax              # Get address of n

  # FUNCTION CALL to read() - begin

  movl %eax, -20(%ebp)              # Save caller-save register to temp
  pushl $35                         # Push arg 3
  leal -6(%ebp), %eax               # Get address of c1
                                    # (Address-of operator '&' used here)
  pushl %eax                        # Push arg 2
  pushl $0                          # Push arg 1
  call _read                        # Call read()
  addl $12, %esp                    # Deallocate argument stack

  # FUNCTION CALL to read() - end

  movl -20(%ebp), %ecx              # Stack machine: copy temp to register
  movl %eax, (%ecx)                 # Perform assignment '='
  movl (%ecx), %edx                 # Copy assignment result to register

  # IF statment - begin

  movl -4(%ebp), %edx               # Get value of a
  cmpl $0, %edx                     # Compare %edx to $0
  sete %dl                          # Perform '=='
  movzbl %dl, %edx                  # Zero-extend the boolean result
  testl %edx, %edx                  # Test the result
  jz .L2_else                       # If result is zero, jump to else clause

  # IF statment - THEN clause - begin


  # FUNCTION CALL to printf() - begin

  movl $LC1, %edx                   # Get addr of string literal 'a has N...'
  pushl %edx                        # Push arg 1
  call _printf                      # Call printf()
  addl $4, %esp                     # Deallocate argument stack

  # FUNCTION CALL to printf() - end


  # IF statment - THEN clause - end

  jmp .L1_done

  # IF statment - ELSE clause - begin

.L2_else:

  # FUNCTION CALL to printf() - begin

  movl $LC2, %eax                   # Get addr of string literal 'a has c...'
  pushl %eax                        # Push arg 1
  call _printf                      # Call printf()
  addl $4, %esp                     # Deallocate argument stack

  # FUNCTION CALL to printf() - end


  # IF statment - ELSE clause - end

.L1_done:

  # IF statment - end


  # FUNCTION CALL to printf() - begin

  movl $LC3, %eax                   # Get addr of string literal 'Exiting...'
  pushl %eax                        # Push arg 1
  call _printf                      # Call printf()
  addl $4, %esp                     # Deallocate argument stack

  # FUNCTION CALL to printf() - end

  movl $0, %eax                     # Set return value
  jmp .L0_function_end              # Exit function
.L0_function_end:
  movl %ebp, %esp                   # Deallocate stack frame
  popl %ebp                         # Restore old stack frame
  ret


# END FUNCTION: main() -------------------------------------------------

.global_vars:

LC0:
  .ascii "Please give input: \12\0"
LC1:
  .ascii "a has NOT changed.\12\0"
LC2:
  .ascii "a has changed. Buffer Overflow!\12\0"
LC3:
  .ascii "Exiting\12\0"
