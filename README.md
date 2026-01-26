
---

# Minecraft Brainfuck Interpreter (v0.3)



基于 Minecraft 数据包实现的 Brainfuck 解释器。支持 8-bit 单元格运算、动态跳转表预处理以及优化的执行逻辑。

此数据包在 1.21.11 中开发，不确定对其他版本的兼容。

## 📖 目录

* [数据结构 (Storage)](#数据结构-Storage)
* [计分板变量 (Scoreboard)](#计分板变量-Scoreboard)
* [指令实现](#指令实现)
* [预处理逻辑](#预处理逻辑)
* [运行逻辑与性能优化](#运行逻辑与性能优化)

---

## 📂 数据结构 (Storage)

所有的用户输入数据存储在 `brainfuck:code` 命名空间中。

| 路径 | 类型 | 说明 |
| --- | --- | --- |
| `code` | String | 用户输入的原始代码字符串 |
| `input` | String | 用户输入的待处理字符串 |
| `array_length` | Int | 用户指定的内存纸带长度，默认为 `30` |

---

---

所有的运行数据存储在 `brainfuck:re` 命名空间中。

| 路径 | 类型 | 说明 |
| --- | --- | --- |
| `array[]` | Byte List | 模拟内存纸带（Tape），默认值为 `0ub` |
| `code.string` | String | 待处理的原始代码字符串 |
| `code.list[]` | String List | 预处理后的指令列表（已过滤非 BF 字符） |
| `code.tmp_char` | String | 字符截取时的临时中间变量 |
| `stack[]` | Int List | 预处理跳转关系时的辅助栈（存储 `[` 的索引） |
| `jump_table[]` | Int List | 跳转表，记录 `[` 与 `]` 互相对应的程序指针（IP） |
| `input` | String | 用户输入的待处理字符串 |
| `output.list[]` | JSON List | 待输出的字符列表，用于 `tellraw` 解析 |
| `output.char` | Compound | 存储从 ASCII 码转换来的 JSON 文本对象 |

---

## 📊 计分板变量 (Scoreboard)

使用计分板 `brainfuck.re` 进行运算。

* **指针控制**：
* `#ptr`: 数组指针，对应 `array` 的索引。
* `#ip`: 程序计数器（Instruction Pointer），对应 `code.list` 的索引。


* **配置与长度**：
* `#array_length`: 纸带最大长度（默认 30）。
* `#code_length`: 经过预处理后的有效指令总数。


* **状态控制**：
* `#running`: 布尔值（0/1），程序是否正在运行。
* `#cmd_stop`: 强制终止信号。


* **性能管理**：
* `#count`: 程序自启动以来的总执行指令数。
* `#count_c`: 单 Tick 运行计数器，达到 `#max_single_command_count` 时强制通过 `schedule` 挂起至下一刻。

* **最大执行次数**:
* `#max_total_command_count` : 最大的总命令执行次数。
* `#max_single_coomand_count` : 单 Tick 内最大的命令执行次数。

---

## 🛠 指令实现

解释器遵循标准 Brainfuck 规范：

* `>` / `<`: 移动 `#ptr`，支持在 `#array_length` 范围内自动取模循环。
* `+` / `-`: 加减当前单元格值，支持 `0-255` 溢出回滚。
* `[`: 若当前单元格为 0，则跳转至 `jump_table[#ip]` 对应的 `]` 之后。
* `]`: 若当前单元格不为 0，则跳转至 `jump_table[#ip]` 对应的 `[` 处。
* `.`: 获取当前单元格数值，通过 `score_to_ascii` 映射后存入 `output.list`。
* `,`: 从 `input` 字符串截取首位字符，转码后写入当前单元格。

---

## 🔍 预处理逻辑

在程序启动前，执行 `preprocess` 以确保执行效率：

1. **String 转 List**: 逐字截取代码，过滤掉所有空格、换行及注释，仅保留有效 8 种符号存入 `code.list`。
2. **Jump Table 建立**:
* 遇到 `[` 时，将其当前的 `#ip` 压入 `stack`。
* 遇到 `]` 时，从 `stack` 弹出对应的 `[` 索引，并在 `jump_table` 中建立双向映射：`table[[]_idx] = ]_idx` 且 `table[]_idx] = [_idx`。


3. **语法检查**: 
* 截取到 `]` 时若 `stack` 为空，抛出 `syntax/close_bracket` 错误。
* 预处理结束后若 `stack` 不为空，抛出 `syntax/open_bracket` 错误。

4. **单线程保证**:
* 如果有正在运行的程序，尝试再运行一个程序会抛出 `runtime/already_running` 错误。

---

## ⚡ 运行逻辑与性能优化

为了防止游戏掉帧（MSPT 飙升），解释器采用了 **递归 + 任务调度** 的混合模式：

* **同 Tick 递归**: 解释器每 Tick 尝试执行最多 `#max_single_command_count` 条指令以保证速度。
* **异步挂起**: 当 `#count_c` 触发阈值，使用 `schedule ... 1t` 将执行流移交给下一游戏刻。
* **递归截断**: 使用 `return run` 确保在触发 `schedule` 或程序结束时，立即切断当前递归链，防止回溯导致的逻辑重跑。
* **错误抛出**: 
    * 如果总执行指令数超过 `#max_total_command_count` 则抛出 `runtime/too_many_executions` 错误。
    * 如果 `,`没有匹配的输入则直接终止程序并输出。

---

## 🚀 如何使用

### 运行程序

1. 按 `G` 打开输入面板，输入 `Code` ， `Input` （可选）并调整 `Array Length` （可选）。
2. 点击 `save` 保存。
3. 再次打开输入面板，点击 `run` 开始运行。
4. 程序运行结束后，将自动打印 `output.list` 中的内容。

### 停止程序

* 在聊天框内输入 <code>/scoreboard players set #cmd_stop brainfuck.re 1</code> 停止正在运行的程序。

### 修改变量

* 在聊天框内输入 <code>/function brainfuck:debug/panel</code> 可以更改变量。

---
