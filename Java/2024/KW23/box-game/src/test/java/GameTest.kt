import dev.battino.Game


class GameTest {
    @Test
    fun test_moveUp_fromFloor_toFloor() {
        val expected = arrayOf(intArrayOf(2), intArrayOf(0))
        val actual = arrayOf(intArrayOf(0), intArrayOf(2))

        val game = Game(actual)
        game.moveUp()
        assertArrayEquals(expected, game.getLevel())
    }
}