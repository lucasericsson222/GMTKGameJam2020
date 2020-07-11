extends Camera2D


export var decay = 0.8
export var max_offset = Vector2(100, 75)
export var max_roll = 0.1
export (NodePath) var target

var trauma = 0
var trauma_power = 2

func _ready():
	randomize()
	add_trauma(5)

func add_trauma(amount):
	trauma = min(trauma + amount, 1.0)

func _process(delta):
	if target:
		global_position = get_node(target).global_position
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()

func shake():
	var amount = pow(trauma, trauma_power)
	rotation = max_roll * amount * rand_range(-1,1)
	offset.x = max_offset.x * amount * rand_range(-1,1)
	offset.y = max_offset.y * amount * rand_range(-1,1)
	

