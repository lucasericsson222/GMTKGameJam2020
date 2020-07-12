extends Sprite

onready var screen_size = get_viewport_rect().size
var direction = 1
var cloud_speed = 30
func _ready():
	randomize()
	var cloud_number = randi()%3
	if (cloud_number == 0):
		texture = load("res://cloud/sprites/cloud1.png")
	if (cloud_number == 1):
		texture = load("res://cloud/sprites/cloud2.png")
	if (cloud_number == 2):
		texture = load("res://cloud/sprites/cloud3.png")

func _process(delta):
	position += Vector2(direction * cloud_speed, 0) * delta
	screen_wrap()
	
func screen_wrap():
	position.x = wrapf(position.x, -50, screen_size.x + 50)
