extends "res://addons/gut/test.gd"


func after_all():
	get_tree().queue_free()

func test_snake_moves():
	var snake = load("res://scenes/Snake.tscn").instance()
	#var snake = Snake.instance()
	var initial = snake.position
	gut.simulate(snake, 5, .1)
	var later = snake.position
	assert_ne(initial, later, "position for snake is the same")

	

	
	