extends Sprite

onready var screen_size = get_viewport_rect().size
var direction = -1
var plane_speed = 0

func _process(delta):
	position += Vector2(direction * plane_speed, 0) * delta
	screen_wrap()
	
func screen_wrap():
	position.x = wrapf(position.x, -50, screen_size.x + 50)

