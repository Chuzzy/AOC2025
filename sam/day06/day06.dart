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

void main() {
  final file = File('input.txt');
  final lines = file.readAsLinesSync();

  print(part1(lines));
}
