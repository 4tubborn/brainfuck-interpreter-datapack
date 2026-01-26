$data modify storage brainfuck:re jump_table[$(ip)] set from storage brainfuck:re match_pos
$data modify storage brainfuck:re jump_table[$(match_pos)] set from storage brainfuck:re ip

#$tellraw @a {text:"$(ip) $(match_pos)"}