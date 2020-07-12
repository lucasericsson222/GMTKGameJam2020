extends Timer




func _on_Timer_timeout():
	$ColorRect2/AnimationPlayer.play("Fade_Out")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fade_Out":
		get_tree().change_scene("res://main_game.tscn")
