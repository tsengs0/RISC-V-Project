## A base repository of 32-bit RISC-V core where the varying instruction extensions are created by distinct branch.

## Work to be done (latest update: 21 Aug., 2022) -> Implementation of  RV32I base ISA which contains 47 instructions, the instruction list is shown as the following table.

| Instruction | Format | Opcode | Description | Current status | Finished |
| ---- | --- | ---------- | -------------------- | ----- | --- |
| lui | U | 2'b0110111 | **Load upper immediate** places the U-immediate value (in the top 20 bits) of the destination register *** rd ***, and fills in the lowest 12 bits with zeros. | in progress | &#x2610; |

The above list is referred to the pp. 18 of [^1].

## Misc.

|checked|unchecked|crossed|
|---|---|---|
|&check;|_|&cross;|
|&#x2611;|&#x2610;|&#x2612;|

## Referencs
[^1]: Patterson, David, and Andrew Waterman. The RISC-V Reader: an open architecture Atlas. Strawberry Canyon, 2017.
[^2]: https://msyksphinz.hatenablog.com/entry/2020/05/18/040000
