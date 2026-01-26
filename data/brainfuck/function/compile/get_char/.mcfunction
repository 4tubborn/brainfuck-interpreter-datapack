#ip从0开始 code_length从1开始（字符串长度）

#tellraw @a {score:{name:"#ip",objective:"brainfuck.re"}}
execute if score #count brainfuck.re > #max_total_command_count brainfuck.re run return run function brainfuck:error/runtime/too_many_executions
execute if score #cmd_stop brainfuck.re matches 1 run return run function brainfuck:compile/get_char/end
execute if score #ip brainfuck.re >= #code_length brainfuck.re run return run function brainfuck:compile/get_char/end

scoreboard players add #count brainfuck.re 1
scoreboard players add #count_c brainfuck.re 1

data remove storage brainfuck:re cur_char
function brainfuck:compile/convert/score_to_storage/ip
function brainfuck:compile/get_char/_ with storage brainfuck:re

function brainfuck:compile/process/

scoreboard players add #ip brainfuck.re 1

execute if score #count_c brainfuck.re <= #max_single_command_count brainfuck.re run return run function brainfuck:compile/get_char/
schedule function brainfuck:compile/get_char/ 1t
scoreboard players set #count_c brainfuck.re 0