#!/usr/bin/env python3

reference = {
    'AND':          [0, 1, 1, 1, -1],
    'OR':           [1, 1, 1, 1, -1],
    'NAND':         [2, 1, 1, 1, -1],
    'XOR':          [3, 1, 1, 1, -1],
    'SUMI':         [4, 1, 1, 1, -1],
    'SUM':          [5, 1, 1, 1, -1],
    'SUB':          [6, 1, 1, 1, -1],
    'IAND':         [16, 1, 1, -1, 1],
    'IOR':          [17, 1, 1, -1, 1],
    'INAND':        [18, 1, 1, -1, 1],
    'IXOR':         [19, 1, 1, -1, 1],
    'ISUMI':        [20, 1, 1, -1, 1],
    'ISUM':         [21, 1, 1, -1, 1],
    'ISUB':         [22, 1, 1, -1, 1],
    'SHIFTLEFT':    [7, 1, 1, -1, -1],
    'SHIFTRIGHT':   [8, 1, 1, -1, -1],
    'SHIFTRIGHTS':  [9, 1, 1, -1, -1],
    'ROTL':         [10, 1, 1, -1, -1],
    'ROTR':         [11, 1, 1, -1, -1],
    'SLT':          [12, 1, 1, 1, -1],
    'BEQ':          [13, -1, 1, 1, 1],
    'BNQ':          [14, -1, 1, 1, 1],
    'JUMP':         [31, -1, -1, -1, 1],
    'ISLT':         [28, 1, 1, -1, 1],
    'LOAD':         [29, 1, 1, -1, 1],
    'STORE':        [30, -1, 1, 1, 1]
}

try:
    compiled = ''
    while(1):
        line = input().upper().strip()
        if '#' in line:
            line, _ = line.split('#')
        operation, line = line.split(' ', 1)
        line = [s.strip() for s in line.split(',')]
        commands = []
        if operation not in reference.keys():
            raise SyntaxError('{} is not a valid operation.'.format(operation))
        commands.append(reference[operation][0])
        if reference[operation][1] > -1:
            commands.append(int(line[0].split('$')[-1]))
            del line[0]
        else:
            commands.append(31)
        if reference[operation][2] > -1:
            commands.append(int(line[0].split('$')[-1]))
            del line[0]
        else:
            commands.append(31)
        if reference[operation][3] > -1:
            commands.append(int(line[0].split('$')[-1]))
            del line[0]
        else:
            commands.append(31)
        if reference[operation][4] > -1:
            commands.append(int(line[0]))
            del line[0]
        else:
            commands.append(4095)
        binary = '{:05b}{:05b}{:05b}{:05b}{:012b}'.format(*commands)
        compiled += '{:08x}\n'.format(int(binary, 2))
except (EOFError):
    print(compiled.strip())
