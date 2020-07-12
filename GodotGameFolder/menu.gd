extends Node2D


var game_scene = preload("res://tutorial.tscn")

func _ready():
	Music._play_dif("menu")
	Music.playing = true

func _on_Button_pressed():
	$Sprite6/AnimationPlayer.play("Fall")



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fall":
		get_tree().change_scene_to(game_scene)
