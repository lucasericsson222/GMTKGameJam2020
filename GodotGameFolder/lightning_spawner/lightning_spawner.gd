extends Sprite

func _ready():
	hide()
	$lightning_timer.connect("timeout",self, "_on_timeout")
	_on_timeout()

func _on_timeout():
	show()
	yield(get_tree().create_timer(.5), "timeout")
	hide()
	yield(get_tree().create_timer(.2), "timeout")
	show()
	yield(get_tree().create_timer(.2), "timeout")
	hide()
	$lightning_timer.start()
	
