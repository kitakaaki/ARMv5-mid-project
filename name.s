.data
    msg:    
            .asciz "*****Print Name*****\n"
            .balign 32
            .asciz "Team 27\n"
            .balign 32
            .asciz  "Hou\n"
            .balign 32
            .asciz  "Huang\n"
            .balign 32
            .asciz  "Hou\n"
            .balign 32
            .asciz "*****End Print*****\n"
            .balign 32
    f:      .asciz  "%s"
.global msg

.text
.global name

name:
        stmfd   sp!, {lr}
        ldr     r4, =msg
        mov     r5, #0 @ counter

        bl      loop
        mov     r0, #0

        ldmfd   sp!, {lr}
        mov     pc, lr

loop:
        stmfd   sp!, {lr}

        ldr     r0, =f
        mov     r1, r4
        bl      printf

        ldmfd   sp!, {lr}

        add     r4, r4, #32 @ move to next string
        add     r5, r5, #1
        cmp     r5, #6
        blt     loop

        mov     pc, lr


