with open('score_to_ascii.mcfunction',"w",encoding="ascii") as f:
    #f.write('scoreboard objectives add c-chr dummy')
    for i in range(32,126):
        try:
            if i not in []:
                char = chr(i)
                json_text = f'{{"text":"{char}"}}'
                f.write(f'\nexecute if score #output brainfuck.re matches {i} run return run data modify storage brainfuck:re output set value {json_text}')
        except UnicodeEncodeError:
            pass