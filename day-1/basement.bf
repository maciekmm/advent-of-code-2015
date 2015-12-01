[
Solution for the second task of day 1
Uses 16bit brainfuck cells
]
+ Basement condition
 Index
 Input
 Check if passed
[
>> Input 
, Read a character
< + > index up
---------------------------------------- Decrement left paranthesis
> + < Check if passed 
[ If right paranthesis it will be one
<< - >> Remove one from basement condition and come back
- Zero the cell
> - < Zero the check
]
> Check if previous check passed
[ Left paranthesis
- Zero the check 
<<< + >>> Add one to initial state
]
<<< Back to basement condition
]

>[>>+>+<<<-]>>>[<<<+>>>-]<<+>[<->[>++++++++++<[->-[>+>>]>[+[-<+>]>+>>]<<<<<]>[-]
  ++++++++[<++++++>-]>[<<+>>-]>[<<+>>-]<<]>]<[->>++++++++[<++++++>-]]<[.[-]<]< Print digits: solution from esolangs wiki