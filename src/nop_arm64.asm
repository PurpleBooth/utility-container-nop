.globl _start
_start:
    mov     w8, #93     /* exit is syscall #93 */
    mov     x0, #0      /* arg0 = 0            */
    svc     #0          /* invoke syscall      */
