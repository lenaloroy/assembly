li $v0, 0                        # Initialize 0

loop:
    bge $a1, $a2, finish         # If $a1 >= $a2, exit loop

    andi $t0, $a1, 1             # Check even
    bnez $t0, not_even           # If odd, next iteration
    
    # Index is even, sum the element A[i]
    sll $t0, $a1, 2              # binary shift by 2 to the left
    add $t1, $a0, $t0            # $t1 = address of A[i]
    lw $t2, 0($t1)               # Load element A[i] into $t2
    add $v0, $v0, $t2            # Add A[i] to sum in $v0

not_even:
    addi $a1, $a1, 1             # Increment i
    j loop                       # next iteration

finish:
    move $s0, $v0                # Store the sum in $s0
