# LBTiny 8-bit Instruction Set Reference


### Legend:
|  Symbol |  Meaning    |
|---------|-------------|
| Z | Zero Flag |  
| C | Carry Flag |
| - | Not Affected |
| 0 | Cleared  |   
| 1 | Set |
| * | Affected based on result |

## IMPLIED (1-Byte)
|Mnemonic | Opcode | Description                 | Z | C | Cycles|
|---------|--------|-----------------------------|---|---|-------|
|NOP      | 0x00   | No Operation                | - | - | 3 |
|SHR      | 0x01   | Shift Right (Acc>>1)        | * | * | 3 |
|SHL      | 0x02   | Shift Left  (Acc<<1)        | * | * | 3 |
|EI       | 0x03   | Enable Interrupts           | - | - | 3 |
|DI       | 0x04   | Disable Interrupts          | - | - | 3 |
|RETI     | 0x05   | Return from Interrupt       | - | - | 3 |
|HALT     | 0x06   | Stop CPU Execution          | - | - | 3 |
|INV      | 0x07   | Bitwise NOT Accumulator     | * | - | 3 |

## IMMEDIATE (2-Bytes)
|Mnemonic | Opcode | Description                 | Z | C | Cycles|
|---------|--------|-----------------------------|---|---|-------|
|LDI   | 0x10   | Load Acc with Immediate     | * | - | 5 |
|ADDI  | 0x11   | Add Immediate to Acc        | * | * | 5 |
|ANDI  | 0x12   | AND Acc with Immediate      | * | 0 | 5 |
|ORI  | 0x13   | OR Acc with Immediate       | * | 0 | 5 |
|XORI | 0x14   | XOR Acc with Immediate      | * | 0 | 5 |

## ADDRESS (2-Bytes)
|Mnemonic | Opcode | Description                 | Z | C | Cycles|
|---------|--------|-----------------------------|---|---|-------|
|LD   | 0x2n   | Load Acc from Memory        | * | - | 7 |
|ST   | 0x3n   | Store Acc to Memory         | - | - | 7 |
|ADD  | 0x4n   | Add Memory to Acc           | * | * | 7 |
|AND  | 0x5n   | AND Acc with Memory         | * | 0 | 7 |
|OR   | 0x6n   | OR Acc with Memory          | * | 0 | 7 |
|XOR  | 0x7n   | XOR Acc with Memory         | * | 0 | 7 |
|JMP  | 0x8n   | Unconditional Jump          | - | - | 7 |
|JZ  | 0x9n   | Jump if Zero (Z=1)          | - | - | 7 |
|JNZ  | 0xAn   | Jump if Not Zero (Z=0)      | - | - | 7 |
|JC   | 0xBn   | Jump if Carry (C=1)         | - | - | 7 |
|JNC  | 0xCn   | Jump if No Carry (C=0)      | - | - | 7 |

## Note 
- For Address Opcodes, 'n' represents the upper 4 bits of the 12-bit address.