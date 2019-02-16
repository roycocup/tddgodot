extends 'res://test/basecase.gd'

const FRUIT_SCENE = 'res://scenes/Fruit.tscn'
const GRID_SCRIPT = 'res://scripts/Grid.gd'

var fruit

func before_each():
	fruit = load(FRUIT_SCENE).instance()
	var dim = {'minX': 0, 'minY': 0, 'maxX': 100, 'maxY': 100}
	var grid = double(GRID_SCRIPT).new()
	stub(GRID_SCRIPT, 'get_dim').to_return(dim)
	fruit.set_grid(grid)

func after_each():
	fruit.free()

func test_fruit_exists_in_grid():
    fruit.place_at(10, 10)
    assert_eq(fruit.position, Vector2(10, 10))