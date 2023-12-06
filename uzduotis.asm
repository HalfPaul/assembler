.model small
.stack 100h

.data
    pradzia          db "Iveskite zodzius: $"
    pabaiga1         db "$"
    pabaiga2         db "(ilgis $"
    pabaiga3         db ")$"
    nulis            db "nulis$"
    vienas           db "vienas$"
    du               db "du$"
    trys             db "trys$"
    keturi           db "keturi$"
    penki            db "penki$"
    sesi             db "sesi$"
    septyni          db "septyni$"
    astuoni          db "astuoni$"
    devyni           db "devyni$"
    buffer           db 255, ?, 255 dup (0)
    nauja_linija     db 13, 10, "$"
    ilgis            db 48

.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset pradzia
    int 21h
    
    mov ah, 0Ah
    mov dx, offset buffer
    int 21h

    mov ah, 09h
    mov dx, offset nauja_linija
    int 21h

    mov ah, 09h
    mov dx, offset pabaiga1
    int 21h

    mov si, offset buffer
    add si, 2
cycle:
    mov al, [ds:si]   
    inc ilgis
replace_one:  
    cmp al, '1' 
    jne replace_two
    mov ah, 09h
    mov dx, offset vienas
    int 21h

    inc si
    cmp byte ptr [ds:si], 0 
    jz replace_two
    jmp cycle

replace_two:
    cmp al, '2' 
    jne replace_three
    mov ah, 09h 
    mov dx, offset du
    int 21h

    inc si 
    cmp byte ptr [ds:si], 0
    jz replace_three
    jmp cycle

replace_three:
    cmp al, '3' 
    jne replace_four
    mov ah, 09h
    mov dx, offset trys                                                  
    int 21h

    inc si                                                      
    cmp byte ptr [ds:si], 0                                     
    jz replace_four                                   
    jmp cycle

replace_four:
    cmp al, '4' 
    jne replace_five
    mov ah, 09h
    mov dx, offset keturi 
    int 21h

    inc si
    cmp byte ptr [ds:si], 0
    jz replace_five
    jmp cycle

replace_five:
    cmp al, '5' 
    jne replace_six
    mov ah, 09h
    mov dx, offset penki
    int 21h

    inc si
    cmp byte ptr [ds:si], 0
    jz replace_six
    jmp cycle
replace_six:
    cmp al, '6'
    jne replace_seven 
    mov ah, 09h 
    mov dx, offset sesi
    int 21h

    inc si 
    cmp byte ptr [ds:si], 0
    jz replace_seven
    jmp cycle
replace_seven:
    cmp al, '7' 
    jne replace_eight
    mov ah, 09h
    mov dx, offset septyni
    int 21h

    inc si
    cmp byte ptr [ds:si], 0
    jz replace_eight
    jmp cycle

replace_eight:
    cmp al, '8' 
    jne replace_nine
    mov ah, 09h 
    mov dx, offset astuoni
    int 21h

    inc si
    cmp byte ptr [ds:si], 0
    jz replace_nine
    jmp cycle

replace_nine:
    cmp al, '9' 
    jne replace_zero
    mov ah, 09h
    mov dx, offset devyni
    int 21h

    inc si
    cmp byte ptr [ds:si], 0
    jz replace_zero
    jmp cycle

replace_zero:
    cmp al, '0' 
    jne output_char
    mov ah, 09h
    mov dx, offset nulis
    int 21h

    inc si
    cmp byte ptr [ds:si], 0
    jz output_ilgis
    jmp cycle 

output_char:
    mov ah, 02h
    mov dl, al
    int 21h

    inc si
    cmp byte ptr [ds:si], 0
    jz output_ilgis
    jmp cycle

output_ilgis:
    mov ah, 09h
    mov dx, offset nauja_linija
    int 21h

    mov ah, 09h 
    mov dx, offset pabaiga2
    int 21h 
    
    sub ilgis, 1

    mov ah, 02h
    mov dl, ilgis
    int 21h

    mov ah, 09h
    mov dx, offset pabaiga3
    int 21h

exit:
    mov ah, 4Ch
    int 21h



end main