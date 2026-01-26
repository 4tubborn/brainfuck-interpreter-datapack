data remove storage brainfuck:re code.tmp_char
data modify storage brainfuck:re code.tmp_char set string storage brainfuck:re code.string 0 1
data modify storage brainfuck:re code.string set string storage brainfuck:re code.string 1

#tellraw @a {storage:"brainfuck:re",nbt:"code.tmp_char"}

#表示转换完了
execute unless data storage brainfuck:re code.tmp_char run return 1

execute \
unless data storage brainfuck:re {code:{tmp_char:"["}} \
unless data storage brainfuck:re {code:{tmp_char:"]"}} \
unless data storage brainfuck:re {code:{tmp_char:"+"}} \
unless data storage brainfuck:re {code:{tmp_char:"-"}} \
unless data storage brainfuck:re {code:{tmp_char:","}} \
unless data storage brainfuck:re {code:{tmp_char:"."}} \
unless data storage brainfuck:re {code:{tmp_char:">"}} \
unless data storage brainfuck:re {code:{tmp_char:"<"}} \
run return run function brainfuck:compile/preprocess/convert/string_to_list/

data modify storage brainfuck:re code.list append from storage brainfuck:re code.tmp_char

data modify storage brainfuck:re jump_table append value 0

#预处理匹配的[与]
execute if data storage brainfuck:re {code:{tmp_char:"["}} run function brainfuck:compile/preprocess/match/stack_push
execute if data storage brainfuck:re {code:{tmp_char:"]"}} unless function brainfuck:compile/preprocess/match/stack_pop/ run return fail

#code_length++;
scoreboard players add #code_length brainfuck.re 1

#execute unless data storage brainfuck:re code.tmp_char run say no


scoreboard players add #ip brainfuck.re 1
return run function brainfuck:compile/preprocess/convert/string_to_list/