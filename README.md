# Computation Theory

Implementations of theoretical computation models

* `register` -- file storing initial configuration and rules of a register machine. Comments written within `/* */`? A register machine has two different types of instructions:
  * Increment register value, then jump to instruction.
  * Decrement register value if > 0, then jump to instruction. Otherwise just jump to other instruction.
  
  Data is stored in (instructionNumber; indexOfRegisterToChange; nextInstruction; optionalOtherNextInstruction)

* `interpreter.py` -- a python interpreter. Run using `$ python interpreter.py <name>`
