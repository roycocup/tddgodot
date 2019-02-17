extends Node2D


func _ready():
	create_scene("Grid2", Node2D.new(), "Grid")
	set_process(true)

func _process(delta):
	check_quit()
	
func check_quit():
	if (Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()


func create_scene(name, root_node, script_name = null):
	var grid = PackedScene.new()
	root_node.name = name
	
	if script_name:
		var script = load('res://scripts/' + script_name + '.gd')
		root_node.set_script(script)

	grid.pack(root_node)
	ResourceSaver.save('res://scenes/' + name + '.tscn', grid)
