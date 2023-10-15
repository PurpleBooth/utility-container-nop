.globl _start
_start:
    mov     w8, #93     /* exit is syscall #93 */
    svc     #0          /* invoke syscall      */