extends Label

var win_scene = preload("res://win_scene.tscn")

func _ready():
	$Timer.connect("timeout", self, "_on_timeout")
	$Timer.start()

func _process(delta):
	var minutes_remaining = int($Timer.time_left / 60)
	var seconds_remaining = int($Timer.time_left - minutes_remaining*60)
	if (seconds_remaining < 10):
		text = String(minutes_remaining) + ":" + "0" + String(seconds_remaining)
	else:
		text = String(minutes_remaining) + ":" + String(seconds_remaining)

func _on_timeout():
	get_tree().change_scene_to(win_scene)
