$execute store result score #tmp_value brainfuck.re run data get storage brainfuck:re array[$(ptr)]
execute if score #tmp_value brainfuck.re matches 0 run return 1
#如果为1，则进行跳转，转到匹配的[后
$execute store result score #ip brainfuck.re run data get storage brainfuck:re jump_table[$(ip)]

