.globl _start
_start:
    mov       $60, %rax   /* system call for exit */
    xor       %rdi, %rdi  /* exit code 0 */
    syscall               /* invoke operating system to exit */
