extends Node2D


func _ready():
	Music._play_dif("end")



func _on_Button_pressed():
	get_tree().change_scene("res://main_game.tscn")
