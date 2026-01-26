
scoreboard objectives add brainfuck.re dummy

#schedule clear brainfuck:compile/get_char/
#设置默认值
execute unless score #max_total_command_count brainfuck.re matches 1.. run scoreboard players set #max_total_command_count brainfuck.re 30000
execute unless score #max_single_command_count brainfuck.re matches 1.. run scoreboard players set #max_single_command_count brainfuck.re 500

return 1
give @a written_book[written_book_content={author:"",title:"bf",pages:[\
[{text:"jump_table\n",click_event:{action:"run_command",command:"function brainfuck:debug/jump_table"}},\
{text:"code\n",click_event:{action:"run_command",command:"function brainfuck:debug/code"}},\
{text:"array\n",click_event:{action:"run_command",command:"function brainfuck:debug/array"}},\
{text:"execute_count\n",click_event:{action:"run_command",command:"function brainfuck:debug/execute_count"}}\
]]}]