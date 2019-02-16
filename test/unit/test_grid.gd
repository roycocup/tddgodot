extends 'res://test/basecase.gd'

# const FRUIT_SCENE = 'res://scenes/Fruit.tscn'
# const FRUIT_SCRIPT = 'res://scripts/Fruit.gd'
const GRID_SCRIPT = 'res://scripts/Grid.gd'

var grid

func before_each():
    grid = load(GRID_SCRIPT).new()
    grid.set_dim(0,0,100,100)

func after_each():
    grid.free()
    
func test_grid_is_ok_for_inside():
    var result = grid.is_inside(10, 10)
    assert_true(result)

    result = grid.is_inside(100, 100)
    assert_true(result)

func test_grid_is_not_ok_for_outside():
    var result = grid.is_inside(-10, 10)
    assert_false(result)

    result = grid.is_inside(10, -10)
    assert_false(result)

    result = grid.is_inside(101, 100)
    assert_false(result)

    result = grid.is_inside(100, 101)
    assert_false(result)