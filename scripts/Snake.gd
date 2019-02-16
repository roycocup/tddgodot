extends Node2D

const DIR_UP = 'up'
const DIR_DOWN = 'down'
const DIR_LEFT = 'left'
const DIR_RIGHT = 'right'

const STATUS_OFF_GRID = 'off_grid'
const STATUS_OK = 'ok'

var grid = null

var speed = 10
var direction = get_random_dir()
var status = STATUS_OK


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
	check_off_grid()

func check_off_grid():
	if !grid.is_inside(position.x, position.y):
		set_status(STATUS_OFF_GRID)
	
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

func set_position(pos):
	position = pos

func get_status():
	return status

func set_status(st):
	status = st

func set_grid(g):
	grid = g
