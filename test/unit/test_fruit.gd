extends 'res://test/basecase.gd'

# const FRUIT_SCENE = 'res://scenes/Fruit.tscn'
const FRUIT_SCRIPT = 'res://scripts/Fruit.gd'
const GRID_SCRIPT = 'res://scripts/Grid.gd'

var fruit

func before_each():
	fruit = load(FRUIT_SCRIPT).new()
	var dim = {'minX': 0, 'minY': 0, 'maxX': 100, 'maxY': 100}
	var grid = double(GRID_SCRIPT).new()
	stub(GRID_SCRIPT, 'get_dim').to_return(dim)
	fruit.set_grid(grid)

func after_each():
	fruit.free()

func test_fruit_exists_in_grid():
    fruit.place_at(10, 10)
    assert_eq(fruit.position, Vector2(10, 10))

func test_fruit_cannot_be_double_placed():
    fruit.place_at(10, 10)
    fruit.place_at(20, 20)
    assert_eq(fruit.position, Vector2(10, 10))