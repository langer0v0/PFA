import sys

if __name__ == "__main__":
    input_str = ""
    val = -1

    if len(sys.argv) >= 2:
        input_str = sys.argv[1]

    input_str = input_str.lower()

    try:
        if input_str.isdigit() == True:
            val = int(input_str)
        elif input_str[0:2].lower() == '0x':
            val = int(input_str[2:], 16)
        elif input_str[0:2].lower() == '0b':
            val = int(input_str[2:], 2)
        elif input_str[0:2].lower() == '0o':
            val = int(input_str[2:], 8)
        elif input_str == '':
            ...
        else:
            print("Invalid number:", input_str)
    except Exception as e:
        print("Invalid number:", input_str)

    if val >= 0:
        print(input_str)
        print("- BIN:", bin(val)[2:])
        print("- OCT:", oct(val)[2:])
        print("- DEC:", val)
        print("- HEX:", hex(val)[2:])

