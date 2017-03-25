# Computation Theory

Implementations of theoretical computation models, combining the course Computation Theory and Compiler Construction (CSTIB, University of Cambridge).

* `register`: text file storing initial configuration and rules of a register machine. Comments written within `/* */`? A register machine has two different types of instructions:
  * Increment register value, then jump to instruction.
  * Decrement register value if > 0, then jump to instruction. Otherwise just jump to other instruction.
  * Data is stored in (instructionNumber; indexOfRegisterToChange; nextInstruction; optionalOtherNextInstruction)

* `lambda`: text file containing a lambda expression of the form:

> Lambda variable1 variable2 ... variable3 . lambdaTerm

* `interpreterRegister.py`: a python interpreter for register machines. Run using `$ python interpreter.py <name>`

* `interpreterLambda.py`: an OCaML interpreter for lambda calculus -- specifically `lambda`. Compiled using `$ ocamlbuild -tag thread -use-ocamlfind -pkg Extlib 'interpreterLambda.{native|byte}'`, with `native` or `byte` varying depending on which version of code the user wishes to compiles to. This creates an executable file. The following libraries were installed using opam:
  * Core.Std
