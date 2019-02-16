extends Node2D

enum {DIR_UP, DIR_DOWN, DIR_LEFT, DIR_RIGHT}

var speed = 10
var direction = get_random_dir()

func _ready():
	pass

func _process(delta):
	move(delta)

func move(delta):
	if direction == DIR_UP:
		position.y = position.y - (delta * speed)
	if direction == DIR_DOWN:
		position.y = position.y + (delta * speed)
	if direction == DIR_LEFT:
		position.x = position.x - (delta * speed)
	if direction == DIR_RIGHT:
		position.x = position.x + (delta * speed)	

func get_random_dir():
	var i = randi() % 3
	if i == 0:
		return DIR_UP
	if i == 1:
		return DIR_DOWN
	if i == 2:
		return DIR_LEFT
	if i == 3:
		return DIR_RIGHT

func set_direction(dir):
	direction = dir
