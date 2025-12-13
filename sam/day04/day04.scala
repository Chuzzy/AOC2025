import scala.io.Source
import scala.util.Try

val input: Array[Array[Char]] = Source.fromFile("input.txt").getLines().map(_.toCharArray).toArray

def numberOfAdjacentRolls(grid: Array[Array[Char]], x: Int, y: Int): Int = {
    val offsets = Array(
        (-1, -1),
        (-1, 0),
        (-1, 1),
        (0, -1),
        (0, 1),
        (1, -1),
        (1, 0),
        (1, 1),
    )

    return offsets.count(offset => Try(grid(y + offset(1))(x + offset(0))).toOption == Some('@'))
}

def part1(input: Array[Array[Char]]): Int = {
    input.zipWithIndex.map {
        case(row, y) => {
            row.zipWithIndex.count {
                case('@', x) => {
                    numberOfAdjacentRolls(input, x, y) < 4
                }
                case _ => false
            }
        }
    }.sum
}

object Application {
    def main(args: Array[String]): Unit = {
        println(part1(input))
    }
}
