package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	data, err := os.ReadFile("input.txt")

	if err != nil {
		panic(err)
	}

	input := strings.Split(strings.ReplaceAll(string(data), "\r\n", "\n"), "\n")
	input = input[:len(input)-1]

	fmt.Println(part1(input))
	fmt.Println(part2(input))
}

func part1(input []string) int {
	dial := 50
	password := 0 // Number of times the dial points at 0

	for _, value := range input {
		direction := value[0]
		distance, _ := strconv.Atoi(value[1:])
		if direction == 'L' {
			dial += distance
		} else {
			dial -= distance
		}
		dial %= 100
		if dial == 0 {
			password++
		}
	}

	return password
}

func part2(input []string) int {
	dial := 50
	password := 0 // Number of times the dial points at or passes 0
	dialStartedAtZero := dial == 0

	for _, value := range input {
		direction := value[0]
		distance, _ := strconv.Atoi(value[1:])
		if direction == 'L' {
			dial += distance
		} else {
			dial -= distance
		}
		password += abs(dial) / 100
		if dial == 0 {
			password++
		} else if dial < 0 && !dialStartedAtZero {
			password++
		}
		dial %= 100
		dialStartedAtZero = dial == 0
		if dial < 0 {
			dial += 100
		}
	}

	return password
}

func abs(x int) (int) {
	if (x < 0) {
		return -x
	}
	return x
}

