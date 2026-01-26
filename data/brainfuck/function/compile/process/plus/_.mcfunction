$execute store result score #tmp_value brainfuck.re run data get storage brainfuck:re array[$(ptr)]
scoreboard players add #tmp_value brainfuck.re 1
execute if score #tmp_value brainfuck.re matches 256.. run scoreboard players set #tmp_value brainfuck.re 0
$execute store result storage brainfuck:re array[$(ptr)] int 1 run scoreboard players get #tmp_value brainfuck.re