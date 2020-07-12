extends Sprite

var fire_scene = preload("res://fire_particles/fire_particles.tscn")

func _crash():
	hide()
	var fire = fire_scene.instance()
	fire.position = position - Vector2(0, -15)
	get_parent().add_child(fire)
