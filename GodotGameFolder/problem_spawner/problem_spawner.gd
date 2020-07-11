extends Node2D

var rng = RandomNumberGenerator.new()
onready var buttons = get_node("/root/plane/controls/Buttons").get_children()
onready var buttons_size = get_node("/root/plane/controls/Buttons").get_child_count()
func _ready():
	randomize()
	$spawn_timer.connect("timeout", self, "_on_timeout")
	
	
	$spawn_timer.start()

func _process(delta):
	pass
	


func _on_timeout():
	var button = rng.randi_range(0, buttons_size - 1)
	var button_name = buttons[button].name
	signal_emitter.emit_signal("needs_pressed", button_name)
	$spawn_timer.start()
