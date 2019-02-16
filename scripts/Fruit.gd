extends Node2D

var grid = null
var showing = false
var eaten = false

func set_grid(g):
	grid = g

func place_at(x, y):
	if !showing:
		position = Vector2(x, y)
		showing = true
		eaten = false
