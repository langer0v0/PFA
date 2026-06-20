import sys
from capstone import *

# python asm2bin.py 01000100010001000100010000110111 demo.s

rv_code = r'''
.globl _start 
.globl main

_start:
main:
    ## TODO
    
    j show_registers_and_stop
    # j stop


.include "./asm/basic.s"
'''

def info_print(text):
    print('\033[32m' + text + '\033[0m')
    return


def bug_print(text):
    print('\033[31m' + text + '\033[0m')
    return


def get_bin(argv):
    if len(argv) < 3:
        bug_print("Too few argument!")
        return 1

    global rv_code
    allow = {'0', '1', '-', '_'}

    if any(char not in allow for char in argv[1]): # assembly code 
        code = argv[1].replace('\\n', '\n')
        info_print("0x80000000:")
        info_print(code)
        res = rv_code.replace('## TODO', code)

        with open(argv[2], "w") as f:
            f.write(res)
    else: # machine code
        code_str = argv[1]
        code_str = code_str.replace('_', '').replace('-', '')

        if (len(code_str) & (31)) != 0:
            bug_print("Invalid length (%d) of the machine code!" % (len(code_str)))
            return 1

        for i in code_str:
            if i == '0' or i == '1':
                continue
            else:
                bug_print("Invalid instructions:", code_str)
                return 1
        
        with open(argv[2], "w") as f:
            start_index = 0
            inst_bytes = bytes([])
            data_code_str = ''
            
            while start_index < len(code_str):
                inst = code_str[start_index:start_index + 32]
                val = int(inst, 2)
                data_code_str += '.word 0x%x\n\t' % val
                inst_bytes += val.to_bytes(length=4, byteorder='little', signed=False)
                start_index += 32
            
            md = Cs(CS_ARCH_RISCV, CS_MODE_RISCV64)
            disasm_res = md.disasm(inst_bytes, 0x80000000)
            asm_len = 0
            j = 0

            for i in disasm_res:
                info_print("0x%x: %s %s \t ->       %s" %(i.address, i.mnemonic, i.op_str, ''.join(f'{b:08b}' for b in inst_bytes[j * 4:(j + 1) * 4])))
                asm_len += 1
                j += 1

            if asm_len != (start_index / 32):
                bug_print("Invalid instruction:", code_str)
                return 1

            res = rv_code.replace('## TODO', data_code_str)
            f.write(res)
            # print(inst_bytes)

    return 0


if __name__ == "__main__":
    res = get_bin(sys.argv)

    if res == 0:
        sys.exit(0)
    else:
        sys.exit(1)
    
    sys.exit(1)
