.text
.global main

main:
    stmfd sp!, {lr}
    bl name
    mov r0, #0
    ldmfd sp!, {lr}
    bx lr