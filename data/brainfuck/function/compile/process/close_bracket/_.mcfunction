$execute store result score #tmp_value brainfuck.re run data get storage brainfuck:re array[$(ptr)]
execute if score #tmp_value brainfuck.re matches 0 run return 1
#如果为1，则进行跳转，转到匹配的[后
scoreboard players operation #ir_ip brainfuck.re = #value brainfuck.re
#$execute store result score #ir_ip brainfuck.re run data get storage brainfuck:re jump_table[$(ip)]