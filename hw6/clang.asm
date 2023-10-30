isPrime(int):                            # @isPrime(int)
        push    rbp
        mov     rbp, rsp
        mov     dword ptr [rbp - 8], edi
        cmp     dword ptr [rbp - 8], 1
        jg      .LBB0_2
        mov     byte ptr [rbp - 1], 0
        jmp     .LBB0_9
.LBB0_2:
        mov     dword ptr [rbp - 12], 2
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
        mov     eax, dword ptr [rbp - 12]
        imul    eax, dword ptr [rbp - 12]
        cmp     eax, dword ptr [rbp - 8]
        jg      .LBB0_8
        mov     eax, dword ptr [rbp - 8]
        cdq
        idiv    dword ptr [rbp - 12]
        cmp     edx, 0
        jne     .LBB0_6
        mov     byte ptr [rbp - 1], 0
        jmp     .LBB0_9
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=1
        jmp     .LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_3 Depth=1
        mov     eax, dword ptr [rbp - 12]
        add     eax, 1
        mov     dword ptr [rbp - 12], eax
        jmp     .LBB0_3
.LBB0_8:
        mov     byte ptr [rbp - 1], 1
.LBB0_9:
        mov     al, byte ptr [rbp - 1]
        and     al, 1
        movzx   eax, al
        pop     rbp
        ret
generatePrimes(int):                    # @generatePrimes(int)
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     qword ptr [rbp - 56], rdi       # 8-byte Spill
        mov     rax, rdi
        mov     qword ptr [rbp - 48], rax       # 8-byte Spill
        mov     qword ptr [rbp - 8], rdi
        mov     dword ptr [rbp - 12], esi
        mov     byte ptr [rbp - 13], 0
        call    std::__1::vector<int, std::__1::allocator<int> >::vector[abi:v160006]()
        mov     dword ptr [rbp - 20], 2
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
        mov     eax, dword ptr [rbp - 20]
        cmp     eax, dword ptr [rbp - 12]
        jg      .LBB1_8
        mov     edi, dword ptr [rbp - 20]
        call    isPrime(int)
        test    al, 1
        jne     .LBB1_3
        jmp     .LBB1_6
.LBB1_3:                                #   in Loop: Header=BB1_1 Depth=1
        mov     rdi, qword ptr [rbp - 56]       # 8-byte Reload
        lea     rsi, [rbp - 20]
        call    std::__1::vector<int, std::__1::allocator<int> >::push_back[abi:v160006](int const&)
        jmp     .LBB1_4
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
        jmp     .LBB1_6
        mov     rdi, qword ptr [rbp - 56]       # 8-byte Reload
        mov     rcx, rax
        mov     eax, edx
        mov     qword ptr [rbp - 32], rcx
        mov     dword ptr [rbp - 36], eax
        call    std::__1::vector<int, std::__1::allocator<int> >::~vector[abi:v160006]()
        jmp     .LBB1_11
.LBB1_6:                                #   in Loop: Header=BB1_1 Depth=1
        jmp     .LBB1_7
.LBB1_7:                                #   in Loop: Header=BB1_1 Depth=1
        mov     eax, dword ptr [rbp - 20]
        add     eax, 1
        mov     dword ptr [rbp - 20], eax
        jmp     .LBB1_1
.LBB1_8:
        mov     byte ptr [rbp - 13], 1
        test    byte ptr [rbp - 13], 1
        jne     .LBB1_10
        mov     rdi, qword ptr [rbp - 56]       # 8-byte Reload
        call    std::__1::vector<int, std::__1::allocator<int> >::~vector[abi:v160006]()
.LBB1_10:
        mov     rax, qword ptr [rbp - 48]       # 8-byte Reload
        add     rsp, 64
        pop     rbp
        ret
.LBB1_11:
        mov     rdi, qword ptr [rbp - 32]
        call    _Unwind_Resume@PLT
__clang_call_terminate:                 # @__clang_call_terminate
        push    rbp
        mov     rbp, rsp
        call    __cxa_begin_catch@PLT
        call    std::terminate()@PLT
.L.str:
        .asciz  "vector"

DW.ref.__gxx_personality_v0:
        .quad   __gxx_personality_v0