execute if score #cur_char brainfuck.re matches 4 run return run function brainfuck:compile/preprocess/loop/add_command/input
execute if score #cur_char brainfuck.re matches 5 run return run function brainfuck:compile/preprocess/loop/add_command/output
execute if score #cur_char brainfuck.re matches 6 run return run function brainfuck:compile/preprocess/match/stack_push
execute if score #cur_char brainfuck.re matches 7 unless function brainfuck:compile/preprocess/match/stack_pop/ run return fail
execute if score #cur_char brainfuck.re matches 7 run return 1
#说明遇到了+-<>，+1以便下次loop进行folding尝试
return run scoreboard players add #folding_count brainfuck.re 1