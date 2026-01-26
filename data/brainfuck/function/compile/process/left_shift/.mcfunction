scoreboard players remove #ptr brainfuck.re 1
execute if score #ptr brainfuck.re matches 0.. run return 1
scoreboard players operation #ptr brainfuck.re = #array_length brainfuck.re
scoreboard players remove #ptr brainfuck.re 1
#function brainfuck:compile/convert/score_to_storage/ptr