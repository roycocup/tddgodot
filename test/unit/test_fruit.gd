extends 'res://test/basecase.gd'

# const FRUIT_SCENE = 'res://scenes/Fruit.tscn'
const FRUIT_SCRIPT = 'res://scripts/Fruit.gd'
const GRID_SCRIPT = 'res://scripts/Grid.gd'

var fruit

func before_each():
	fruit = load(FRUIT_SCRIPT).new()
	var grid = double(GRID_SCRIPT).new()
	stub(GRID_SCRIPT, 'is_inside').to_return(true)
	fruit.set_grid(grid)

func after_each():
	fruit.free()

func test_fruit_exists_in_grid():
    fruit.place_at(10, 10)
    assert_eq(fruit.position, Vector2(10, 10))

func test_fruit_cannot_be_double_placed():
    fruit.place_at(10, 10)
    fruit.place_at(20, 20)
    assert_eq(fruit.position, Vector2(10, 10), "fruit is in two places")

func test_fruit_cannot_be_placed_outside_of_grid():
    var grid = double(GRID_SCRIPT).new()
    stub(GRID_SCRIPT, 'is_inside').to_return(false)
    fruit.set_grid(grid)

    fruit.place_at(-10, 10)
    fruit.place_at(10, -10)
    fruit.place_at(101, 10)
    fruit.place_at(10, 101)
    assert_eq(fruit.showing, false, "Fruit should not be showing as its outside the grid")