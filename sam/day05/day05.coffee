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

  ids = new Set

  ranges.forEach((range) =>
    ids.add(id) for id in [range[0]..range[1]]
  )

  ids.size

console.log part1(input)
console.log part2(input)
