extends AnimatedSprite

var warning = false
func _ready():
	$UnClickTimer.connect("timeout", self, "_on_un_pressed")
	signal_emitter.connect("needs_pressed", self, "_on_needs_pressed")
	$WarningTimer.connect("timeout", self, "_on_failure_to_press")

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				clicked()

func clicked():
	$UnClickTimer.start()
	play("pressed")
	warning = false
	$WarningTimer.stop()

func not_clicked():
	if (!warning):
		play("not_pressed")

func _on_un_pressed():
	not_clicked()


func _on_needs_pressed(button):
	if name == button and warning == false:
		play("warning")
		$WarningTimer.start(5)
		warning == true
		
func _on_failure_to_press():
	signal_emitter.emit_signal("add_to_altitude", -1000)
	signal_emitter.emit_signal("add_trauma", 1)
	play("not_pressed")
