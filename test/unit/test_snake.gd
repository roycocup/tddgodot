extends "res://addons/gut/test.gd"

var snake

func before_all():
	snake = load("res://scenes/Snake.tscn").instance()

func after_all():
	snake.queue_free()

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


	

	
	