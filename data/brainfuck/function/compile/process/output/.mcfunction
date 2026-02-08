data remove storage brainfuck:re output.char

function brainfuck:compile/convert/score_to_storage/ptr

function brainfuck:compile/process/output/store with storage brainfuck:re

#execute if data storage brainfuck:re {output:"Cannot convert score to ASCII"} run tellraw @a {score:{name:"#output",objective:"brainfuck.re"}}
data modify storage brainfuck:re output.list append from storage brainfuck:re output.char