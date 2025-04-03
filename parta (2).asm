# $v0 = (10 + $a2) * ($a3 - $a1)
addi $t0, $a2, 10      # $t0 = 10 + $a2
sub $t1, $a3, $a1      # $t1 = $a3 - $a1
mul $v0, $t0, $t1      # $v0 = $t0 * $t1

# $v1 = (($a1 * 18) * 4) - (($a2 + $a0) * 2)
mul $t2, $a1, 18       # $t2 = $a1 * 18
sll $t3, $t2, 2        # $t3 = $t2 * 4 (left binary shift by 2)
add $t4, $a2, $a0      # $t4 = $a2 + $a0
sll $t5, $t4, 1        # $t5 = $t4 * 2 (left binary shift by 1)
sub $v1, $t3, $t5      # $v1 = $t3 - $t5
