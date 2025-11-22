.data
    string_functoin1:
        .asciz "Function1: Name\n"
    string_function2:
        .asciz "Function2: ID\n"
    string_main:
        .asciz "\nMain Function:\n"
    string_print_all:
        .asciz "*****Print All*****\n"
    string_end_print:
        .asciz "*****End Print*****\n"
.text
.global main

main:
    stmfd sp!, {lr} 

    @ Call Name function  
    ldr r0, = string_functoin1
    bl  printf
    bl name   

    @ Call ID function
    ldr r0, = string_function2
    bl  printf     
    bl ID   

    @ Main function print all
    ldr r0, = string_main
    bl  printf   
    ldr r0, = string_print_all
    bl  printf

    @ print id1, name1
    ldr     r0, =format_int
    ldr     r1, =id1
    ldr     r1, [r1]
    bl      printf

    @ print id2, name2
    ldr     r0, =format_int
    ldr     r1, =id2    
    ldr     r1, [r1]
    bl      printf

    @ print id3, name3
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

    @ print end message
    ldr r0, = string_end_print
    bl  printf
    mov r0, #0        
    ldmfd sp!, {lr}   
    bx lr 



