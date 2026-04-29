import os

def generate_mcfunction_files(start_exp=2, end_exp=11):
    """
    生成 2^2 到 2^11 的 mcfunction 文件。
    文件名：<数值>.mcfunction
    """
    for exp in range(start_exp, end_exp + 1):
        length = 2 ** exp
        filename = f"{length}.mcfunction"
        filename = os.path.join("/data/brainfuck/function/init/array/", filename)
        
        # 生成长度为 length 的 "0ub, 0ub, ..." 列表
        zeros_list = ', '.join(['0ub'] * length)
        
        content = f"""scoreboard players remove #array_length_c brainfuck.re {length}
data modify storage brainfuck:re array_buffer set value [{zeros_list}]
data modify storage brainfuck:re array append from storage brainfuck:re array_buffer[]
function brainfuck:init/array/_"""
        try:
            with open(filename, 'w') as f:
                f.write(content)
        except Exception as e:
            print(f"写入失败: {e}")
        
        print(f"已生成: {filename} (长度 {length})")

if __name__ == "__main__":
    generate_mcfunction_files()