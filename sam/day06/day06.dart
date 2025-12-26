import 'dart:io';

int part1(List<String> input) {
  var total = 0;
  final cells = input
      .map(
        (line) =>
            line.split(' ').where((e) => !e.isEmpty).toList(growable: false),
      )
      .toList(growable: false);

  for (var i = 0; i < cells[0].length; i++) {
    final operation = cells[4][i];
    var answer = int.parse(cells[0][i]);
    for (var j = 1; j < 4; j++) {
      if (operation == '*') {
        answer *= int.parse(cells[j][i]);
      } else {
        answer += int.parse(cells[j][i]);
      }
    }
    total += answer;
  }

  return total;
}

int part2(List<String> input) {
  final cells = RegExp(r'[+*]\s{1,5}')
      .allMatches(input.last)
      .map((match) {
        var startIndex = match.start;
        var endIndex = match.end;

        return [
          input[0].substring(startIndex, endIndex),
          input[1].substring(startIndex, endIndex),
          input[2].substring(startIndex, endIndex),
          input[3].substring(startIndex, endIndex),
          input[4][startIndex],
        ];
      })
      .toList(growable: false);

  return cells
      .map((column) {
        final operation = column.last;
        final List<int> numbers = [];

        for (var i = 0; i < column.first.length; i++) {
          final num = int.tryParse(
            (column[0][i] + column[1][i] + column[2][i] + column[3][i]).trim(),
          );

          if (num != null) {
            numbers.add(num);
          }
        }

        return numbers.reduce(
          (acc, curr) => operation == '*' ? acc * curr : acc + curr,
        );
      })
      .reduce((acc, elem) => acc + elem);
}

void main() {
  final file = File('input.txt');
  final lines = file.readAsLinesSync();

  print(part1(lines));
  print(part2(lines));
}
