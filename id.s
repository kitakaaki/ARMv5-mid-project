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
id1:    .word 0      
id2:    .word 0      
id3:    .word 0      
sum:    .word 0      

    .section .bss
id1_string: .space 12
id2_string: .space 12
id3_string: .space 12
sum_string: .space 12

    .section .text
.global print_string
.global read_string
.global ID

print_string:
    stmfd   sp!, {lr}        @ push lr
    mov     r0, #1             @ stdout
    mov     r7, #4             @ sys_write
    @ r1 = string pointer
    @ r2 = string length         
    swi 0
    ldmfd   sp!, {lr}        @ pop lr
    bx      lr

read_string:
    stmfd   sp!, {lr}
    mov     r2, #11
    @ r1 = buffer pointer
    mov     r0, #0  @ stdin
    mov     r7, #3  @ sys_read
    swi     #0  
    ldmfd   sp!, {lr}
    bx      lr

ID:
    @ push lr
    stmfd   sp!, {lr}
    @ Print input ID header
    ldr     r1, =string_input_id      
    mov     r2, #24  
    bl      print_string   
    @ Input Member 1 ID
    ldr     r1, =string_prompt1      
    mov     r2, #32  
    bl      print_string
    @ read Member 1 ID
    ldr     r1, =id1_string      
    bl      read_string
    @output Member 1 ID
    ldr     r1, =id1_string
    mov     r2, #11
    bl     print_string
    @ pop lr
    ldmfd   sp!, {lr}
    mov     r0, #0
    bx      lr

