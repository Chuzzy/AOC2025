use std::fs;

fn main() {
    let data = fs::read_to_string("input.txt").expect("Unable to read input");
    let input: Vec<&str> = data.trim().split(",").collect();

    println!("{}", part1(&input));
    println!("{}", part2(&input));
}

fn part1(input: &Vec<&str>) -> u64 {
    let mut sum = 0;

    for range in input {
        let ids: Vec<&str> = range.split("-").collect();
        let start: u64 = ids[0].parse().unwrap();
        let end: u64 = ids[1].parse().unwrap();

        for id in start..end {
            let string = id.to_string();
            let length = string.len();
            if length % 2 != 0 {
                continue;
            }

            let halflength = length / 2;
            let firsthalf = &string[0..halflength];
            let secondhalf = &string[halflength..];

            if firsthalf == secondhalf {
                sum += id;
            }
        }
    }

    sum
}

fn part2(input: &Vec<&str>) -> u64 {
    let mut sum = 0;

    for range in input {
        let ids: Vec<&str> = range.split("-").collect();
        let start: u64 = ids[0].parse().unwrap();
        let end: u64 = ids[1].parse().unwrap();

        'ids: for id in start..end {
            let string = id.to_string();
            let length = string.len();

            for i in 1..((length / 2) + 1) {
                let sequence = &string[0..i];
                let repetitions = length / &sequence.len();

                if sequence.repeat(repetitions) == string {
                    sum += id;
                    continue 'ids;
                }
            }
        }
    }

    sum
}

