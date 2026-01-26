#tellraw @a [{score:{name:"#ptr",objective:"brainfuck.re"}},{text:" "},{storage:"brainfuck:re",nbt:"ptr"}]

#execute if data storage brainfuck:re {cur_char:"+"} run say plus
#execute if data storage brainfuck:re {cur_char:"-"} run say minus
#execute if data storage brainfuck:re {cur_char:"<"} run say ls
#execute if data storage brainfuck:re {cur_char:">"} run say rs
#execute if data storage brainfuck:re {cur_char:"."} run say out
#execute if data storage brainfuck:re {cur_char:","} run say in
#execute if data storage brainfuck:re {cur_char:"["} run say open
#execute if data storage brainfuck:re {cur_char:"]"} run say close

execute if data storage brainfuck:re {cur_char:"+"} run return run function brainfuck:compile/process/plus/
execute if data storage brainfuck:re {cur_char:"-"} run return run function brainfuck:compile/process/minus/
execute if data storage brainfuck:re {cur_char:"<"} run return run function brainfuck:compile/process/left_shift/
execute if data storage brainfuck:re {cur_char:">"} run return run function brainfuck:compile/process/right_shift/
execute if data storage brainfuck:re {cur_char:"."} run return run function brainfuck:compile/process/output/
execute if data storage brainfuck:re {cur_char:","} run return run function brainfuck:compile/process/input/
execute if data storage brainfuck:re {cur_char:"["} run return run function brainfuck:compile/process/open_bracket/
execute if data storage brainfuck:re {cur_char:"]"} run return run function brainfuck:compile/process/close_bracket/