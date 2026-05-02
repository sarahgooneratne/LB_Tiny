Interrupts

* NMI (Non-maskable interrupt)
* IRQ (Interrupt Request)



Memory Layout

* 12 bit address with a data width of 8 bits
* 0x000 - 0xBFF 	ROM (3k)
* 0xC00 - 0xEFF		RAM (768B)
* 0xF00 - 0xFFF		I/O (256B)
* Interrupt vectors in fixed locations in ROM (TBD)



ALU

* Add/Sub (Carry flag, zero flag)
* Shift left/right
* NAND



Instruction set

* HLT 					(Halt)
* NOP					(No operation)
* ADD 		addr12		(Add value from memory to accumulator)
* ADDI 		imm8		(Add immediate value to accumulator)
* SHR 					(Logical shift right)
* SHL 					(Logical shift left)
* NAND		addr12		(NAND value from memory with accumulator)
* NANDI	 	imm8		(NAND immediate value with accumulator)
* JC 		addr12		(Jump if carry)
* JZ 		addr12		(Jump if zero)
* JNC		addr12		(Jump if not carry)
* JNZ		addr12		(Jump if not zero)
* LDA 		addr12		(Load accumulator from memory)
* LDI 		imm8		(Load accumulator with immediate value)
* STA 		addr12		(Store accumulator to memory)
* SIE 					(Set interrupt enable)
* CIE 					(Clear interrupt enable)
* RETI 					(Return from interrupt)