# LB Tiny



Interrupts

* NMI (Non-maskable interrupt)
* IRQ (Interrupt Request)



Memory Layout

* 12 bit address with a data width of 4 bits
* Beginning has reset vector
* End has the NMI and IRQ vectors
* Rest is program memory



ALU

* Add/Sub (Carry flag, zero flag, negative flag(?))
* Logical shift left/right
* Arithmetic shift right
* NAND



Instruction set

* HLT (Halt)
* NOP
* ADD
* SUB
* ASR (arithmetic shift right)
* LSR (logical shift right)
* LSL (logical shift left)
* NAND
* JC (jump if carry)
* JZ (jump if zero)
* JN (jump if negative) (?)
* LDA (Load accumulator from memory)
* STA (store accumulator to memory)
* OUT (value from the accumulator is sent to peripherals)

