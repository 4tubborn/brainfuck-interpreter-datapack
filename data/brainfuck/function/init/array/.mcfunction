data remove storage brainfuck:re array
data modify storage brainfuck:re array set value []

scoreboard players operation #array_length_c brainfuck.re = #array_length brainfuck.re
function brainfuck:init/array/_