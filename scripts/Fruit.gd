extends Node2D

var grid = null
var showing = false
var eaten = false

func set_grid(g):
	grid = g

func place_at(x, y):
	if !showing && grid.is_inside(x,y):
		position = Vector2(x, y)
		showing = true
		eaten = false
