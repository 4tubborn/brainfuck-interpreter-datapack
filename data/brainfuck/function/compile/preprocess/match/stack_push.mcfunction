function brainfuck:compile/convert/score_to_storage/ir_ip
data modify storage brainfuck:re stack append from storage brainfuck:re ir_ip
data modify storage brainfuck:re code.list append value {"cmd":"[",value:-1}
scoreboard players add #ir_ip brainfuck.re 1
return 1