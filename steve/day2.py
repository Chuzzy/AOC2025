#!/usr/bin/env python3

def read_inputs(day, part) -> list:
    file = f"inputs/day{day}_{part}.txt"
    with open(file, "r") as f:
        return [item for line in f for item in line.strip().split(',') if item]

# ls = read_inputs(2, 1)
ls = read_inputs(2, 2)

def part1(ls: list):
    sum = 0
    for ids in ls:
        start, stop = ids.split('-')
        for id in range(int(start), int(stop) + 1):
            s_id = str(id)
            mid = len(s_id) // 2
            if s_id[:mid] == s_id[mid:]:
                sum += int(id)
    return sum

def repeated_patterns(id) -> bool:
    for pattern_length in range(1, len(id) // 2 + 1):
        if len(id) % pattern_length == 0:
            pattern = id[:pattern_length]
            if pattern * (len(id) // pattern_length) == id:
                return True 

    return False

def part2(ls: list):
    sum = 0
    for ids in ls:
        start, stop = ids.split('-')
        for id in range(int(start), int(stop) + 1):
            s_id = str(id)
            if repeated_patterns(s_id): sum += id
    return sum

# print(part1(ls))
print(part2(ls))