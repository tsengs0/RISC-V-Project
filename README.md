A base repository of 32-bit RISC-V core where the varying instruction extensions are created by distinct branches.

## Work to be done (latest update: 21 Aug., 2022)
Implementation of  RV32I base ISA which contains 47 instructions, the instruction list is shown as the following table.

| Instruction | Format | Opcode [binary] | Description | Current status | Finished |
| ---- | --- | ---------- | -------------------- | ----- | --- |
| add | R | 2'b011_0011 | **Add registers** | in progress | &#x2610; |
| sub | R | 2'b011_0011 | **Subtract register** | in progress | &#x2610; |
| sll | R | 2'b011_0011 | **Shift left logical by register** | in progress | &#x2610; |
| srl | R | 2'b011_0011 | **Shift right logical by register** | in progress | &#x2610; |
| sra | R | 2'b011_0011 | **Shift right arithmetic by register** | in progress | &#x2610; |
| and | R | 2'b011_0011 | **Bitwise AND with register** | in progres | &#x2610; |
| or | R | 2'b011_0011 | **Bitwise OR with register** | in progress | &#x2610; |
| xor | R | 2'b011_0011 | **Bitwise XOR with register** | in progress | &#x2610; |
| slt | R | 2'b011_0011 | **Set if less than register, 2's complement** | in progress | &#x2610; |
| sltu | R | 2'b011_0011 | **Set if less than register, unsigned** | in progress | &#x2610; |
| addi | I | 2'b001_0011 | **Add immediate** Inst[31:20]=imm[11:0] | in progress | &#x2610; |
| slli | I | 2'b001_0011 | **Shift left logical by immediate** Inst[31:20]={{7{1'b0}}, shamt[4:0]} | in progress | &#x2610; |
| srli | I | 2'b001_0011 | **Shift right logical by immediate** Inst[31:20]={{7{1'b0}}, shamt[4:0]} | in progress | &#x2610; |
| srai | I | 2'b001_0011 | **Shift right arithmetic by immediate** Inst[31:20]={{7{1'b0}}, shamt[4:0]} | in progress | &#x2610; |
| andi | I | 2'b001_0011 | **Bitwise AND with immediate** Inst[31:20]=imm[11:0]. It performs AND on register *rs1* and the sign-extended 12-bit immediate, and then place the result in *rd*. | in progress | &#x2610; |
| ori | I | 2'b001_0011 | **Bitwise OR with immediate** Inst[31:20]=imm[11:0] | in progress | &#x2610; |
| xori | I | 2'b001_0011 | **Bitwise XOR with immediate** Inst[31:20]=imm[11:0] | in progress | &#x2610; |
| slti | I | 2'b001_0011 | **Set if less than immediate, 2's complement** inst[31:20]=imm[11:0] | in progress | &#x2610; |
| sltiu | I | 2'b001_0011 | **Set if less than immediate, unsigned** Inst[31:20]=imm[11:0] | in progress | &#x2610; |
| lui | U | 2'b011_0111 | **Load upper immediate** places the U-immediate value (in the top 20 bits) of the destination register **rd**, and fills in the lowest 12 bits with zeros. | in progress | &#x2610; |
| auipc | U | 2'b001_0111 | **Add upper immediate to PC** forms a 32-bit offset from the 20-bit U-immediate (in order to build PC-relateive addresses), filling in the lowest 12 bits with zeros, adds this offset to the **PC**, then places the result in register **rd**. | in progress | &#x2610; |

The above list is referred to the pp. 18 of [^1].

## Misc.

|checked|unchecked|crossed|
|---|---|---|
|&check;|_|&cross;|
|&#x2611;|&#x2610;|&#x2612;|

**The website to preview the README.md**: https://markdownlivepreview.com/

## Referencs
[^1]: Patterson, David, and Andrew Waterman. The RISC-V Reader: an open architecture Atlas. Strawberry Canyon, 2017.
[^2]: https://msyksphinz.hatenablog.com/entry/2020/05/18/040000
