extends AnimatedSprite

var pos = 3

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
