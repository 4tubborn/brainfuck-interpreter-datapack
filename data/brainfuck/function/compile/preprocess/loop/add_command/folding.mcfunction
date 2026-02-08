#say fold

execute if score #folding_count brainfuck.re matches 0 run return 1
data modify storage brainfuck:re code.list append value {cmd:"",value:-1}

#say folding
#tellraw @a {score:{name:"#folding_count",objective:"brainfuck.re"}}

execute store result storage brainfuck:re code.list[-1].value int 1 run scoreboard players get #folding_count brainfuck.re
scoreboard players set #folding_count brainfuck.re 0
scoreboard players add #ir_ip brainfuck.re 1


#execute if score #last_char brainfuck.re matches 0 run say yes

execute if score #last_char brainfuck.re matches 0 run return run data modify storage brainfuck:re code.list[-1].cmd set value "+"
execute if score #last_char brainfuck.re matches 1 run return run data modify storage brainfuck:re code.list[-1].cmd set value "-"
execute if score #last_char brainfuck.re matches 2 run return run data modify storage brainfuck:re code.list[-1].cmd set value "<"
execute if score #last_char brainfuck.re matches 3 run return run data modify storage brainfuck:re code.list[-1].cmd set value ">"