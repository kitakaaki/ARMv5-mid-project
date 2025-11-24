    .section .data
string_input_id:
    .asciz "*****Input ID*****\n"
string_prompt1:
    .asciz "** Please Enter Member 1 ID:**\n"
string_prompt2:
    .asciz "** Please Enter Member 2 ID:**\n"
string_prompt3:
    .asciz "** Please Enter Member 3 ID:**\n"
string_command:
    .asciz "** Please Enter Command **\n"
string_output:
    .asciz "*****Print Team Member ID and ID Summation*****\n"
string_end_print:
    .asciz "*****End Print*****\n"
string_sum:
    .asciz "ID Summation = "
string_new_line:
    .asciz "\n"

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
    stmfd   sp!, {lr}       @ 1.
    mov     r4, sp          @ 2. save original sp in r4 
    mov     r5, r5          @ 3. NOP-like 
    mov     r6, r6          @ 4. NOP-like
    mov     r7, r7          @ 5. NOP-like
    rsbs    sp, lr, pc      @ 6. assignment required
    mov     sp, r4 

    @ Print header
    ldr     r0, =string_input_id
    bl      printf

    @ Input Member 1 ID
    ldr     r0, =string_prompt1
    bl      printf
    ldr     r0, =format_scanf
    ldr     r1, =id1
    bl      scanf

    @ Input Member 2 ID
    ldr     r0, =string_prompt2
    bl      printf
    ldr     r0, =format_scanf
    ldr     r1, =id2
    bl      scanf

    @ Input Member 3 ID
    ldr     r0, =string_prompt3
    bl      printf
    ldr     r0, =format_scanf
    ldr     r1, =id3
    bl      scanf

    @ calculate sum
    ldr     r0, =id1
    ldr     r0, [r0]
    ldr     r1, =id2
    ldr     r1, [r1]
    add     r0, r0, r1
    ldr     r1, =id3
    ldr     r1, [r1]
    add     r0, r0, r1
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
    ldr     r0, =string_new_line
    bl      printf
    ldr     r0, =string_sum
    bl      printf
    ldr     r0, =format_int
    ldr     r1, =sum
    ldr     r1, [r1]
    bl      printf

    @ Print end string
    ldr     r0, =string_end_print
    bl      printf

    ldmfd   sp!, {lr}
    bx      lr

