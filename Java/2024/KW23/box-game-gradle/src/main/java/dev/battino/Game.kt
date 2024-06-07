package dev.battino

import dev.battino.Exceptions.BorderCollisionException
import java.awt.Point
import javax.swing.border.Border

class Game(level: Array<IntArray>, playerStartPosition: Point) {
    private val cleanPlayer = playerStartPosition
     var player = cleanPlayer
    private val cleanField: Array<IntArray> = level
     var field = deepCopy(cleanField)

    var won = false

     enum class Tile {
        EMPTY,
        WALL,
        BOX,
        BUTTON,
        ACTIVE,
        UNKNOWN
    }

    enum class Direction {
        NORTH,
        SOUTH,
        WEST,
        EAST
    }

    private fun deepCopy(array: Array<IntArray>): Array<IntArray> {
        val clone = Array(array.size) { IntArray(array[0].size) }
        for (i in array.indices) {
            System.arraycopy(array[i], 0, clone[i], 0, array[i].size)
        }
        return clone
    }

    fun isPlayer(x: Int, y: Int): Boolean = player.x == x && player.y == y

    fun intToTile(int: Int): Tile {
        return when (int) {
            0 -> Tile.EMPTY
            1 -> Tile.WALL
            3 -> Tile.BOX
            4 -> Tile.BUTTON
            5 -> Tile.ACTIVE
            else -> Tile.UNKNOWN
        }
    }

    fun tileToInt(tile: Tile): Int {
        return when (tile) {
            Tile.EMPTY -> 0
            Tile.WALL -> 1
            Tile.BOX -> 3
            Tile.BUTTON -> 4
            Tile.ACTIVE -> 5
            Tile.UNKNOWN -> -1
        }
    }

    fun getNextPoint(x: Int, y: Int, direction: Direction): Point {
        val point = Point(x, y)
        when (direction) {
            Direction.NORTH -> point.y--
            Direction.SOUTH -> point.y++
            Direction.WEST -> point.x--
            Direction.EAST -> point.x++
        }
        if (point.y !in field.indices || point.x !in field[0].indices) {
           throw BorderCollisionException("You're Trying to leave the Playing Area")
        }
        return point
    }

    fun getTile(location: Point): Tile = intToTile(field[location.y][location.x])

    fun movePlayer(direction: Direction) {
        val newPlayerLocation: Point
        try {
            newPlayerLocation = getNextPoint(player.x, player.y, direction)
        }
        catch (e:BorderCollisionException){
            return
        }
        when (getTile(newPlayerLocation)) {
            Tile.EMPTY -> player = newPlayerLocation
            Tile.WALL -> {}
            Tile.BOX -> {
                // This first tries to move the box, if the box move is successful the player is
                // moved
                if (moveBox(newPlayerLocation, direction)) player = newPlayerLocation
            }
            Tile.BUTTON -> player = newPlayerLocation
            Tile.ACTIVE -> {
                // This first tries to move the box, if the box move is successful the player is
                // moved
                if (moveBox(newPlayerLocation, direction)) player = newPlayerLocation
            }
            Tile.UNKNOWN -> throw Exception("Something went wrong...")
        }
    }

    fun setTile(location: Point, tile: Tile) {
        field[location.y][location.x] = tileToInt(tile)
    }

    fun moveBox(location: Point, direction: Direction): Boolean {
        val newBoxLocation: Point
        try {

        newBoxLocation = getNextPoint(location.x, location.y, direction)
        }
        catch (e:BorderCollisionException){
            return false
        }
        when (getTile(newBoxLocation)) {
            Tile.EMPTY -> {
                if (getTile(location) == Tile.ACTIVE) setTile(location, Tile.BUTTON)
                else setTile(location, Tile.EMPTY)
                setTile(newBoxLocation, Tile.BOX)
                won = hasWon()
                return true
            }
            Tile.WALL -> return false
            Tile.BOX -> return false
            Tile.BUTTON -> {
                if (getTile(location) == Tile.ACTIVE) setTile(location, Tile.BUTTON)
                else setTile(location, Tile.EMPTY)
                setTile(newBoxLocation, Tile.ACTIVE)
                won = hasWon()
                return true
            }
            Tile.UNKNOWN -> throw Exception("Something went wrong...")
            Tile.ACTIVE -> return false
        }
    }

    fun hasWon(): Boolean = 0 == field.sumOf { it.count { tile -> tile == tileToInt(Tile.BUTTON) } }

    fun moveUp() {
        movePlayer(Direction.NORTH)
        println("UP")
    }

    fun moveDown() {
        movePlayer(Direction.SOUTH)
        println("DOWN")
    }

    fun moveLeft() {
        movePlayer(Direction.WEST)
        println("LEFT")
    }

    fun moveRight() {
        movePlayer(Direction.EAST)
        println("RIGHT")
    }

    fun resetField() {
        field = deepCopy(cleanField)
        player = cleanPlayer
        println("ESC")
    }

    fun getColCount(): Int {
        return field.size
    }

    fun getRowCount(): Int {
        return field[0].size
    }
}
