# Computation Theory

Implementations of Register Machines and Turing Machines

* *register.soph* -- file in which configurations of register machine data are stored. Comments are supported by placing them inside the escapement characters /* */? A register machine has two types of instructions:
  * Increment register, then jump to instruction.
  * Decrement register if > 0, then jump to instruction. Otherwise just jump to other instruction.
  Data is stored in the format instruction number; register to change; next instruction(s)

* *interpreter.py* -- interpreter which reads register.soph

* *encoder.py* -- (in progress) encodes and decodes register machine instructions into a number.
