extends Node2D


var game_scene = preload("res://main_game.tscn")


func _on_Button_pressed():
	get_tree().change_scene_to(game_scene)
