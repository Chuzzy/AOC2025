import scala.io.Source
import scala.util.Try

def isAccessibleByForklift(grid: Array[Array[Char]], x: Int, y: Int): Boolean = {
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

    offsets.count(offset => Try(grid(y + offset(1))(x + offset(0))).toOption == Some('@')) < 4
}

def isRoll(grid: Array[Array[Char]], coordinate: (Int, Int)): Boolean = {
    grid(coordinate(1))(coordinate(0)) == '@'
}

def removeAccessibleRolls(grid: Array[Array[Char]]): Int = {
    val coordinatesOfRollsToRemove: IndexedSeq[(Int, Int)] =
        (0 until grid.length).map(y => (0 until grid(0).length).map(x => (x, y))).flatten
        .filter(coord => isRoll(grid, coord) && isAccessibleByForklift(grid, coord(0), coord(1)))

    coordinatesOfRollsToRemove.foreach(coord => {
        grid(coord(1))(coord(0)) = '.'
    })

    coordinatesOfRollsToRemove.length
}

def part1(input: Array[Array[Char]]): Int = {
    input.zipWithIndex.map {
        case(row, y) => {
            row.zipWithIndex.count {
                case('@', x) => isAccessibleByForklift(input, x, y)
                case _ => false
            }
        }
    }.sum
}

def part2(input: Array[Array[Char]]): Int = {
    var total = 0
    var numberOfRemovedRolls = 67
    var grid = input

    while (numberOfRemovedRolls > 0) {
        numberOfRemovedRolls = removeAccessibleRolls(grid)
        total += numberOfRemovedRolls
    }

    total
}

object Application {
    def main(args: Array[String]): Unit = {
        val input: Array[Array[Char]] = Source.fromFile("input.txt").getLines().map(_.toCharArray).toArray

        println(part1(input))
        println(part2(input))
    }
}
