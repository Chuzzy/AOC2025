#!/usr/bin/env python3

def read_inputs(day, part) -> list:
    file = f"inputs/day{day}_{part}.txt"
    with open(file, "r") as f:
        return [item for line in f for item in line.strip().split(',') if item]

ls = read_inputs(2, 1)

def part1(ls: list):
    sum = 0
    for ids in ls:
        id1, id2 = ids.split('-')
        for id in range(int(id1), int(id2) + 1):
            s_id = str(id)
            mid = len(s_id) // 2
            if s_id[:mid] == s_id[mid:]:
                sum += int(id)
    return sum

print(part1(ls))