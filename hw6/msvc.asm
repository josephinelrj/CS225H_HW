`string' DB 'vector<T> too long'
        DB      00H                               ; `string'
$ip2state$void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64 DD imagerel void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64
        DD      0ffffffffH
        DD      imagerel void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64+57
        DD      00H
        DD      imagerel void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64+118
        DD      0ffffffffH
        DD      imagerel int `void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64'::`1'::catch$0
        DD      00H
        DD      imagerel int `void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64'::`1'::catch$0+13
        DD      01H
        DD      imagerel int `void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64'::`1'::catch$0+54
        DD      00H
$handlerMap$0$void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64 DD 00H
        DD      00H
        DD      00H
        DD      imagerel int `void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64'::`1'::catch$0
        DD      038H
$tryMap$void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64 DD 00H
        DD      00H
        DD      01H
        DD      01H
        DD      imagerel $handlerMap$0$void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64
$stateUnwindMap$void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64 DD 0ffffffffH
        DD      00H
        DD      0ffffffffH
        DD      00H
$cppxdata$void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64 DD 019930522H
        DD      02H
        DD      imagerel $stateUnwindMap$void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64
        DD      01H
        DD      imagerel $tryMap$void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64
        DD      06H
        DD      imagerel $ip2state$void std::vector<int,std::allocator<int> >::_Reallocate(unsigned __int64) __ptr64
        DD      068H
        DD      00H
        DD      00H

i$1 = 0
n$ = 32
bool isPrime(int) PROC                              ; isPrime
$LN8:
        mov     DWORD PTR [rsp+8], ecx
        sub     rsp, 24
        cmp     DWORD PTR n$[rsp], 1
        jg      SHORT $LN5@isPrime
        xor     al, al
        jmp     SHORT $LN1@isPrime
$LN5@isPrime:
        mov     DWORD PTR i$1[rsp], 2
        jmp     SHORT $LN4@isPrime
$LN2@isPrime:
        mov     eax, DWORD PTR i$1[rsp]
        inc     eax
        mov     DWORD PTR i$1[rsp], eax
$LN4@isPrime:
        mov     eax, DWORD PTR i$1[rsp]
        imul    eax, DWORD PTR i$1[rsp]
        cmp     eax, DWORD PTR n$[rsp]
        jg      SHORT $LN3@isPrime
        mov     eax, DWORD PTR n$[rsp]
        cdq
        idiv    DWORD PTR i$1[rsp]
        mov     eax, edx
        test    eax, eax
        jne     SHORT $LN6@isPrime
        xor     al, al
        jmp     SHORT $LN1@isPrime
$LN6@isPrime:
        jmp     SHORT $LN2@isPrime
$LN3@isPrime:
        mov     al, 1
$LN1@isPrime:
        add     rsp, 24
        ret     0
bool isPrime(int) ENDP                              ; isPrime

i$1 = 32
primes$ = 40
__$ReturnUdt$ = 80
limit$ = 88
std::vector<int,std::allocator<int> > generatePrimes(int) PROC ; generatePrimes
$LN7:
        mov     DWORD PTR [rsp+16], edx
        mov     QWORD PTR [rsp+8], rcx
        sub     rsp, 72                             ; 00000048H
        lea     rcx, QWORD PTR primes$[rsp]
        call    std::vector<int,std::allocator<int> >::vector<int,std::allocator<int> >(void) __ptr64 ; std::vector<int,std::allocator<int> >::vector<int,std::allocator<int> >
        mov     DWORD PTR i$1[rsp], 2
        jmp     SHORT $LN4@generatePr
$LN2@generatePr:
        mov     eax, DWORD PTR i$1[rsp]
        inc     eax
        mov     DWORD PTR i$1[rsp], eax
$LN4@generatePr:
        mov     eax, DWORD PTR limit$[rsp]
        cmp     DWORD PTR i$1[rsp], eax
        jg      SHORT $LN3@generatePr
        mov     ecx, DWORD PTR i$1[rsp]
        call    bool isPrime(int)                 ; isPrime
        movzx   eax, al
        test    eax, eax
        je      SHORT $LN5@generatePr
        lea     rdx, QWORD PTR i$1[rsp]
        lea     rcx, QWORD PTR primes$[rsp]
        call    void std::vector<int,std::allocator<int> >::push_back(int const & __ptr64) __ptr64 ; std::vector<int,std::allocator<int> >::push_back
$LN5@generatePr:
        jmp     SHORT $LN2@generatePr
$LN3@generatePr:
        lea     rdx, QWORD PTR primes$[rsp]
        mov     rcx, QWORD PTR __$ReturnUdt$[rsp]
        call    ??0?$vector@HV?$allocator@H@std@@@std@@QEAA@$QEAV01@@Z ; ??0?$vector@HV?$allocator@H@std@@@std@@QEAA@$QEAV01@@Z
        lea     rcx, QWORD PTR primes$[rsp]
        call    std::vector<int,std::allocator<int> >::~vector<int,std::allocator<int> >(void) __ptr64 ; std::vector<int,std::allocator<int> >::~vector<int,std::allocator<int> >
        mov     rax, QWORD PTR __$ReturnUdt$[rsp]
        add     rsp, 72                             ; 00000048H
        ret     0
std::vector<int,std::allocator<int> > generatePrimes(int) ENDP ; generatePrimes
