execute if score #array_length_c brainfuck.re matches 0 run return 1
scoreboard players remove #array_length_c brainfuck.re 1
data modify storage brainfuck:re array append value 0ub

#say 1

function brainfuck:init/array/_