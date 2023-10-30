isPrime(int):
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-20], edi
        cmp     DWORD PTR [rbp-20], 1
        jg      .L4
        mov     eax, 0
        jmp     .L5
.L4:
        mov     DWORD PTR [rbp-4], 2
        jmp     .L6
.L8:
        mov     eax, DWORD PTR [rbp-20]
        cdq
        idiv    DWORD PTR [rbp-4]
        mov     eax, edx
        test    eax, eax
        jne     .L7
        mov     eax, 0
        jmp     .L5
.L7:
        add     DWORD PTR [rbp-4], 1
.L6:
        mov     eax, DWORD PTR [rbp-4]
        imul    eax, eax
        cmp     DWORD PTR [rbp-20], eax
        jge     .L8
        mov     eax, 1
.L5:
        pop     rbp
        ret
generatePrimes(int):
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 40
        mov     QWORD PTR [rbp-40], rdi
        mov     DWORD PTR [rbp-44], esi
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    std::vector<int, std::allocator<int> >::vector() [complete object constructor]
        mov     DWORD PTR [rbp-20], 2
        jmp     .L13
.L15:
        mov     eax, DWORD PTR [rbp-20]
        mov     edi, eax
        call    isPrime(int)
        test    al, al
        je      .L14
        lea     rdx, [rbp-20]
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rdx
        mov     rdi, rax
        call    std::vector<int, std::allocator<int> >::push_back(int const&)
.L14:
        mov     eax, DWORD PTR [rbp-20]
        add     eax, 1
        mov     DWORD PTR [rbp-20], eax
.L13:
        mov     eax, DWORD PTR [rbp-20]
        cmp     DWORD PTR [rbp-44], eax
        jge     .L15
        jmp     .L19
        mov     rbx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    std::vector<int, std::allocator<int> >::~vector() [complete object destructor]
        mov     rax, rbx
        mov     rdi, rax
        call    _Unwind_Resume
.L19:
        mov     rax, QWORD PTR [rbp-40]
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
.LC0:
        .string "vector::_M_realloc_insert"