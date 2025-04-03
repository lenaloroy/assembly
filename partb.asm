# Load
lw $t0, 0($a0)      # $t0 = w
lw $t1, 4($a0)      # $t1 = x
lw $t2, 8($a0)      # $t2 = y
lw $t3, 12($a0)     # $t3 = z

# (y - w) % (x + z)
sub $t4, $t2, $t0   # $t4 = y - w
add $t5, $t1, $t3   # $t5 = x + z
div $t4, $t5        # Divide (y - w) by (x + z)
mfhi $t6            # $t6 = remainder
sw $t6, 16($a0)     # Store at 16

# (-(x - y)) * ((z + w) * 2)
sub $t7, $t1, $t2   # $t7 = x - y
negu $t7, $t7       # $t7 = -(x - y)
add $t8, $t3, $t0   # $t8 = z + w
sll $t9, $t8, 1     # $t9 = (z + w) * 2
mul $t7, $t7, $t9   # $t7 = (-(x - y)) * ((z + w) * 2)
sw $t7, 20($a0)     # Store at 20