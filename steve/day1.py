#!/usr/bin/env python3

# Crack the vault
# Rotate the dial with: L/R 0-99
# Dial starts at 50

dial = 50
ticks = 0

def read_inputs(day, part) -> list:
    file = (f"inputs/day{day}_{part}.txt")
    with open(file, "r",) as f:
        return [line.strip() for line in f if line.strip()]
    
ls = read_inputs(1,2)

def part1(ls, dial, ticks):
    for rotation in ls:
        direction, move = rotation[0], int(rotation[1:])
        if direction == "R":
            dial += move
        else:
            dial -= move
        dial %= 100
        ticks += dial == 0
    return ticks

def part2(ls, dial, ticks):
    for rotation in ls:
        direction, move = rotation[0], int(rotation[1:])
        for _ in range(move):
            if direction == "R":
                dial += 1
            else:
                dial -= 1
            dial %= 100
            ticks += dial == 0
    return ticks

# print(part1(ls, dial, ticks))
print(part2(ls, dial, ticks))
            