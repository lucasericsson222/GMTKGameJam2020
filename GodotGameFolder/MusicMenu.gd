extends AudioStreamPlayer

var yes_music = true

func toggle_music():
	if (yes_music):
		yes_music = false
		stop()
	else:
		yes_music = true
		play()

func _ready():

	stream = preload("res://menu.wav")
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		toggle_music()

func _play_dif(name):
	if name == "end":
		stream = preload("res://end2.wav")
	elif name == "game":
		stream = preload("res://game.wav")
	else:
		stream = preload("res://menu.wav")
	if yes_music:
		play()
