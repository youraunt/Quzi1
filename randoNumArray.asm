INCLUDE Irvine32.inc
upperBound equ 128                    ; set upperBound
lowerBound equ 127                    ; set lowerBound
numElements = 50                      ; set number of elements to create 

.data
arrayd sdword numElements dup(?)

.code
main proc
call randomize 
mov ecx,numElements
mov esi,0
L1:       
   mov eax,upperBound+lowerBound
   call randomrange
   sub eax, upperBound
   mov arrayd[esi*4],eax
   inc esi
   loop L1

   mov ecx,numElements
   mov esi,0
L2:
   mov eax,arrayd[esi*4]
   call writeInt
   mov al,20h
   call writeint
    inc esi
    loop L2
exit
main endp
end main
