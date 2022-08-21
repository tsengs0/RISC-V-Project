A base repository of 32-bit RISC-V core where the varying instruction extensions are created by distinct branches.

## Work to be done (latest update: 21 Aug., 2022)
Implementation of  RV32I base ISA which contains 47 instructions, the instruction list is shown as the following table.

| Instruction | Format | Opcode [binary] | Description | Current status | Finished |
| ---- | --- | ---------- | -------------------- | ----- | --- |
| lui | U | 2'b011_0111 | **Load upper immediate** places the U-immediate value (in the top 20 bits) of the destination register **rd**, and fills in the lowest 12 bits with zeros. | in progress | &#x2610; |
| auipc | U | 2'b001_0111 | **Add upper immediate to PC** forms a 32-bit offset from the 20-bit U-immediate (in order to build PC-relateive addresses), filling in the lowest 12 bits with zeros, adds this offset to the **PC**, then places the result in register **rd**. | in progress | &#x2610; |

The above list is referred to the pp. 18 of [^1].

## Misc.

|checked|unchecked|crossed|
|---|---|---|
|&check;|_|&cross;|
|&#x2611;|&#x2610;|&#x2612;|

## Referencs
[^1]: Patterson, David, and Andrew Waterman. The RISC-V Reader: an open architecture Atlas. Strawberry Canyon, 2017.
[^2]: https://msyksphinz.hatenablog.com/entry/2020/05/18/040000
