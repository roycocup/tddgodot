extends Node2D

var dim = null

func set_dim(minX, minY, maxX, maxY):
	dim = {'minX':minX, 'minY':minY, 'maxX':maxX, 'maxY':maxY}

func get_dim():
	return dim

func is_inside(x,y):
	if x < dim.minX || x > dim.maxX:
		return false
	if y < dim.minY || y > dim.maxY:
		return false
	return true