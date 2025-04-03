# load bytes
lb $t0, 0($a1)   # 1st (0xF0)
lb $t1, 1($a1)   # 2nd (0xAA)
lb $t2, 2($a1)   # 3rd (0x9C)
lb $t3, 3($a1)   # 4th (0xB1)

# Get bits
andi $t0, $t0, 0x07   # 1st last 3 bits
andi $t1, $t1, 0x3F   # 2nd last 6 bits
andi $t2, $t2, 0x3F   # 3rd last 6 bits
andi $t3, $t3, 0x3F   # 4th last 6 bits

# position
sll  $t0, $t0, 18     # 1st bits 18-20
sll  $t1, $t1, 12     # 2nd bits 12-17
sll  $t2, $t2, 6      # 3rd bits 6-11

# combine
or   $t0, $t0, $t1
or   $t0, $t0, $t2
or   $t0, $t0, $t3

# store
move $a0, $t0