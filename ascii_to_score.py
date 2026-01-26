with open('ascii_to_score.mcfunction',"w",encoding="ascii") as f:
    #f.write('scoreboard objectives add c-chr dummy')
    for i in range(32,126):
        try:
            if i not in []:
                char = chr(i)
                json_text = f'{{"ascii_tmp":"{char}"}}'
                f.write(f'\nexecute if data storage brainfuck:re {json_text} run return {i}')
        except UnicodeEncodeError:
            pass