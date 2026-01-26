execute if data storage brainfuck:re {stack:[]} run return fail
#]匹配到的[一定是stack里的最后一个
function brainfuck:compile/convert/score_to_storage/ip
data modify storage brainfuck:re match_pos set from storage brainfuck:re stack[-1]
data remove storage brainfuck:re stack[-1]
function brainfuck:compile/preprocess/match/stack_pop/set_jump_table with storage brainfuck:re
return 1