extends AnimatedSprite


func _ready():
	$UnClickTimer.connect("timeout", self, "_on_un_pressed")

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				clicked()

func clicked():
	$UnClickTimer.start()
	play("pressed")

func not_clicked():
	play("not_pressed")

func _on_un_pressed():
	not_clicked()
