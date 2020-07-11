extends AnimatedSprite

var pos = 3

func _ready():
	$AddWind.connect("timeout", self, "_on_add_variance")
	$AddWind.start()
	
func _process(delta):
	frame = pos
	signal_emitter.emit_signal("add_to_plane_tilt", pos - 3, delta)



func _on_AreaDown_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.is_pressed():
				increment_pos()

func increment_pos():
	if pos + 1 > 7:
		return
	
	pos += 1

func decrement_pos():
	if pos - 1 < 0:
		return
	
	pos -= 1


func _on_AreaUp_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.is_pressed():
				decrement_pos()

func _on_add_variance():
	if (pos > 3):
		increment_pos()
	elif pos < 3:
		decrement_pos()
	elif pos == 3:
		if randi()%2 == 0:
			increment_pos()
		else:
			decrement_pos()
		
