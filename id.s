

    .section .data
string_input_id:
    .asciz "*****Input ID*****\n"
string_prompt:
    .asciz "** Please Enter Member 1 ID:**\n"
    .asciz "** Please Enter Member 2 ID:**\n"
    .asciz "** Please Enter Member 3 ID:**\n"

string_command:
    .asciz "** Please Enter Command **\n"
string_output:
    .asciz "*****Print Team Member ID and ID Summation*****\n"
string_end_print:
    .asciz "*****End Print*****\n"
string_sum:
    .asciz "\nID Summation = "

format_int:   .asciz "%d\n"
format_scanf: .asciz "%d"
format_char:  .asciz "%c"

id1:    .word 0
id2:    .word 0
id3:    .word 0
sum:    .word 0
cmd:    .word 0      

.global format_int, id1, id2, id3, sum, string_sum

    .section .text
.global ID

ID:
    stmfd   sp!, {r4, r5, r6, lr}

    @ Print header
    ldr     r0, =string_input_id
    bl      printf

    ldr     r4, =string_prompt

    mov     r7, sp
    rsbs    sp, lr, pc
    mov     sp, r7



    @  Read three members' ID (use loop)
    @ r3 points to the print string
    mov     r5, #3               @ read 3 IDs

    @ prepare one ID address
    ldr     r6, =id1             @ r2 = &id1\
    str     r6, [sp, #-4]!
    add     sp, sp, #4
    str     r6, [sp, #-4]
    add     sp, sp, #-4
    add     sp, sp, #4
    moveq   r6, r6
    movne   r6, r6
loop:

    mov     r0, r4
    bl      printf

    ldr     r0, =format_scanf
    mov     r1, r6
    bl      scanf

    add   r4, r4, #32
    add     r6, r6, #4
    subs    r5, r5, #1
    cmp     r5, #0
    bgt     loop


    @ calculate sum
    ldr     r0, =id1
    ldr     r0, [r0]
    ldr     r1, =id2
    ldr     r1, [r1]
    add     r0, r0, r1
    ldr     r1, =id3
    ldr     r1, [r1]
    add     r0, r0, r1, lsl #0
    ldr     r1, =sum
    str     r0, [r1]

    @ input command
    ldr     r0, =string_command
    bl      printf
    ldr     r0, =format_scanf
    ldr     r1, =cmd
    bl      scanf

    @ Print output header
    ldr     r0, =string_output
    bl      printf

    @ Print Member 1 ID
    ldr     r0, =format_int
    ldr     r1, =id1
    ldr     r1, [r1]
    bl      printf

    @ Print Member 2 ID
    ldr     r0, =format_int
    ldr     r1, =id2
    ldr     r1, [r1]
    bl      printf

    @ Print Member 3 ID
    ldr     r0, =format_int
    ldr     r1, =id3
    ldr     r1, [r1]
    bl      printf

    @ Print Sum label and value
    ldr     r0, =string_sum
    bl      printf
    ldr     r0, =format_int
    ldr     r1, =sum
    ldr     r1, [r1]
    bl      printf

    @ Print end string
    ldr     r0, =string_end_print
    bl      printf

    ldmfd   sp!, {r4, r5, r6, lr}
    mov pc, lr

