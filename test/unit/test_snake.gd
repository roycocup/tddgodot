
extends "res://test/basecase.gd"

const SNAKE_SCENE = 'res://scenes/Snake.tscn'
const GRID_SCRIPT = 'res://scripts/Grid.gd'

var snake

func before_each():
	snake = load(SNAKE_SCENE).instance()
	var dim = {'minX': 0, 'minY': 0, 'maxX': 100, 'maxY': 100}
	var grid = double(GRID_SCRIPT).new()
	grid.set_dim(dim)
	snake.set_grid(grid)

func after_each():
	snake.free()

func test_snake_moves():	
	var initial = snake.position
	gut.simulate(snake, 5, .1)
	var later = snake.position
	assert_ne(initial, later, "position for snake is the same")

func test_random_direction_returns_one_of_4():
	var result = snake.get_random_dir()
	assert(result == snake.DIR_UP || result == snake.DIR_DOWN || result == snake.DIR_RIGHT || result == snake.DIR_LEFT)

func test_if_direction_is_set_snake_moves_in_that_direction():
	snake.set_direction(snake.DIR_UP)
	var start = snake.position
	gut.simulate(snake, 1, .1)
	var end = snake.position
	assert_ne(start, end, "snake is not moving")
	assert_lt(end[1], start[1], "not moving up")


func test_snake_is_moving_in_correct_speed():
	snake.set_direction(snake.DIR_UP)
	var start = snake.position
	gut.simulate(snake, 1, .1)
	var end = snake.position
	
	# expect the y to move this much
	var expected = start[1]-( snake.speed * .1)
	assert_eq(end[1], expected, "snake speed is not correct")

func test_if_snake_touches_borders_sets_game_over():
	snake.set_position(Vector2())
	snake.set_direction(snake.DIR_UP)
	gut.simulate(snake, 1, .1)
	assert_eq(snake.get_status(), snake.STATUS_OFF_GRID, "Snake is off grid but status is not consistent")

	snake.set_status(snake.STATUS_OK)

	snake.set_position(Vector2())
	snake.set_direction(snake.DIR_LEFT)
	gut.simulate(snake, 1, .1)
	assert_eq(snake.get_status(), snake.STATUS_OFF_GRID, "Snake is off grid but status is not consistent")

	snake.set_status(snake.STATUS_OK)

	snake.set_position(Vector2(100,100))
	snake.set_direction(snake.DIR_DOWN)
	gut.simulate(snake, 1, .1)
	gut.p(snake.position)
	assert_eq(snake.get_status(), snake.STATUS_OFF_GRID, "Snake is off grid but status is not consistent")

	


	