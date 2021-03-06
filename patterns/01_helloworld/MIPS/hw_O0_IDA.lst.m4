include(`commons.m4').text:00000000 main:
.text:00000000
.text:00000000 var_10          = -0x10
.text:00000000 var_8           = -8
.text:00000000 var_4           = -4
.text:00000000
; _EN(`function prologue.')_RU(`пролог функции')
; _EN(`save GP and FP in the stack')_RU(`сохранить GP и FP в стеке'):
.text:00000000                 addiu   $sp, -0x20
.text:00000004                 sw      $ra, 0x20+var_4($sp)
.text:00000008                 sw      $fp, 0x20+var_8($sp)
; _EN(`set FP (stack frame pointer)')_RU(`установить FP (указатель стекового фрейма)'):
.text:0000000C                 move    $fp, $sp
; _EN(`set')_RU(`установить') GP:
.text:00000010                 la      $gp, __gnu_local_gp
.text:00000018                 sw      $gp, 0x20+var_10($sp)
; _EN(`load address of the text string')_RU(`загрузить адрес текстовой строки'):
.text:0000001C                 lui     $v0, (aHelloWorld >> 16)  # "Hello, world!"
.text:00000020                 addiu   $a0, $v0, (aHelloWorld & 0xFFFF)  # "Hello, world!"
; _EN(`load address of puts() address using GP')_RU(`загрузить адрес функции puts() используя GP'):
.text:00000024                 lw      $v0, (puts & 0xFFFF)($gp)
.text:00000028                 or      $at, $zero ; NOP
; _EN(`call to')_RU(`вызвать') puts():
.text:0000002C                 move    $t9, $v0
.text:00000030                 jalr    $t9
.text:00000034                 or      $at, $zero ; NOP
; _EN(`restore GP from local stack')_RU(`восстановить GP из локального стека'):
.text:00000038                 lw      $gp, 0x20+var_10($fp)
; _EN(`set register')_RU(`установить регистр') $2 ($V0) _EN(`to zero')_RU(`в ноль'):
.text:0000003C                 move    $v0, $zero
; _EN(`function epilogue')_RU(`эпилог функции').
; _EN(`restore')_RU(`восстановить') SP:
.text:00000040                 move    $sp, $fp
; _EN(`restore')_RU(`восстановить') RA:
.text:00000044                 lw      $ra, 0x20+var_4($sp)
; _EN(`restore')_RU(`восстановить') FP:
.text:00000048                 lw      $fp, 0x20+var_8($sp)
.text:0000004C                 addiu   $sp, 0x20
; _EN(`jump to')_RU(`переход на') RA:
.text:00000050                 jr      $ra
.text:00000054                 or      $at, $zero ; NOP
