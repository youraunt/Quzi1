INCLUDE Irvine32.inc                  ; dependencies 
upperBound equ 128                    ; set upperBound
lowerBound equ 127                    ; set lowerBound
numElements = 50                      ; set number of elements to create 
clearESI equ xor esi, esi             ; Macro to clear the source index
setCounter equ mov ecx, numElements   ; Macro to set the counter to size of array

.data                                 
    arrayd sdword numElements dup(?)      ; Declare an array with numElements all initialized to unitialized 

.code
main proc                             ; main procedure
    call randomize                        ; seed 
    setCounter                            ; Move numElements into ecx as counter
    clearESI                              ; Clear extended source index 

L1:                                   ; Enter the first loop
    mov eax,upperBound+lowerBound      ; Set eax to the sum of upperBound and lowerBound
    call randomRange                   ; call randomRange which creates random ints from 0 to eax
    sub eax, upperBound                ; subtract the upperBound to get numbers within the desired range includen negatives
    mov arrayd[esi*4],eax              ; Move the contents of eax into a the array 
                                        ; at position of source (index*4) to account for 32-bit size of random number
    inc esi                            ; Increment the index by one
loop L1                               ; Repeat the loop until ecx counter == zero 

    setCounter                         ; Reset counter to numElements
    clearESI                           ; Reset extended source index to zero 

L2:                                    ; Enter the second loop
    mov eax,arrayd[esi*4]              ; Move the arrayD index*4 for dword size into eax
    inc esi                            ; increment index
loop L2                                ; Repeat the loop until ecx counter == zero 

setCounter                             ; Reset counter to numElements
clearESI                               ; Reset extended source index to zero

L3:
    mov eax, arrayd[esi*4]
    call writeInt                      ; display integer in eax to console 
    mov al, 0Ah                        ; move 0Ah, ASCII line feed into al
    call writeChar                     ; call writeChar to execute line feed
    inc esi                            ; increment the idex by one
loop L3                                ; Repeat the loop until ecx counter == zero 

exit
main endp
end main
