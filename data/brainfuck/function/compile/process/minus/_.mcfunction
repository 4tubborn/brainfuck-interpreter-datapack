$execute store result score #tmp_value brainfuck.re run data get storage brainfuck:re array[$(ptr)]
scoreboard players operation #tmp_value brainfuck.re -= #value brainfuck.re
scoreboard players operation #tmp_value brainfuck.re %= #256 brainfuck.re
$execute store result storage brainfuck:re array[$(ptr)] int 1 run scoreboard players get #tmp_value brainfuck.re