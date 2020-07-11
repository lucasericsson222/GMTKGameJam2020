extends Sprite

func _ready():
	signal_emitter.connect("rotation_changed", self, "_on_rotation_changed")
	signal_emitter.connect("tilt_changed", self, "_on_tilt_changed")
var rot = PI
var tilt = 0

onready var centered_position = position

func _process(delta):
	rotation = rot
	position = centered_position + Vector2(0, tilt)

func _on_rotation_changed(new_rot):
	rot = new_rot + PI

func _on_tilt_changed(new_tilt):
	tilt = new_tilt
