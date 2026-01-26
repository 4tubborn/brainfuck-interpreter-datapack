def convert_to_brainfuck_no_loops(text, start_cell=0):
    """
    快速将文本转换为无循环的Brainfuck代码
    
    参数:
        text: 要转换的文本
        start_cell: 起始单元格位置
        
    返回:
        (brainfuck_code, stats_dict)
    """
    code_parts = []
    
    # 移动到起始单元格
    if start_cell > 0:
        code_parts.append('>' * start_cell)
    
    # 处理每个字符
    for i, char in enumerate(text):
        ascii_val = ord(char)
        code_parts.append('+' * ascii_val)  # 设置值
        code_parts.append('.')              # 输出
        
        # 移动到下一个单元格（如果不是最后一个字符）
        if i < len(text) - 1:
            code_parts.append('>')
    
    code = ''.join(code_parts)
    
    # 统计
    stats = {
        'total': len(code),
        'chars': len(text),
        'plus': code.count('+'),
        'minus': code.count('-'),
        'dot': code.count('.'),
        'left': code.count('<'),
        'right': code.count('>')
    }
    
    return code, stats

# 使用示例
if __name__ == "__main__":
    # 快速转换HELLO
    code, stats = convert_to_brainfuck_no_loops("Hello world!")
    print("HELLO的Brainfuck代码（无循环）:")
    with open('out.txt',"w",encoding="ascii") as f:
        f.write(code)
    print(code[:100] + "..." if len(code) > 100 else code)
    print(f"\n统计: {stats}")