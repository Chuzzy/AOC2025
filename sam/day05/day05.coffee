fs = require 'fs'

input = fs.readFileSync('input.txt', 'utf-8').trim().split('\n')

part1 = (input) =>
  ranges = input.map((line) =>
    match = line.match /(\d+)-(\d+)/
    [BigInt(match[1]), BigInt(match[2])] if match
  ).filter((x) => x)
  
  ids = input.map((line) => 
    match = line.match /^\d+$/
    BigInt(match) if match
  ).filter((id) => id and ranges.some((range) => range[0] <= id <= range[1]))

  ids.length

part2 = (input) => 
  ranges = input.map((line) =>
    match = line.match /(\d+)-(\d+)/
    [BigInt(match[1]), BigInt(match[2])] if match
  ).filter((x) => x)

  sorted = ranges.slice().sort (a, b) ->
    if a[0] < b[0] then -1 else if a[0] > b[0] then 1 else 0

  total = 0n
  cur_start = sorted[0][0]
  cur_end = sorted[0][1]
  for r in sorted.slice(1)
    s = r[0]
    e = r[1]
    if s > cur_end + 1n
      total += cur_end - cur_start + 1n
      cur_start = s
      cur_end = e
    else
      if e > cur_end then cur_end = e

  total += cur_end - cur_start + 1n
  total

console.log part1(input)
console.log part2(input)
