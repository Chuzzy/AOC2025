#!/usr/bin/env python3

def read_inputs(day, part) -> list:
    file = (f"inputs/day{day}_{part}.txt")
    with open(file, "r",) as f:
        return [line.strip() for line in f if line.strip()]
    
ls = read_inputs(3, 1)

def maximum_voltage(bank): 
    largest_joltage = [0,0]
    for i in range(len(bank) - 1):
        battery = int(bank[i])
        if battery > largest_joltage[0]: 
            largest_joltage[0], largest_joltage[1] = battery, int(max(bank[i+1:]))
    return int(''.join(map(str, largest_joltage)))

def part1(ls: list) -> int:
    test = [
        '818181911112111',
        '234234234234278',
        '811111111111119',
        '987654321111111'
    ]
    sum = 0
    for bank in ls:
        sum += maximum_voltage(bank)
    return sum

print(part1(ls))