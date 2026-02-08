data remove storage brainfuck:re code.list[-1]

execute if score #ip_offset brainfuck.re matches 0 run return 1
scoreboard players remove #ip_offset brainfuck.re 1
function brainfuck:compile/preprocess/loop/add_command/reset/rm