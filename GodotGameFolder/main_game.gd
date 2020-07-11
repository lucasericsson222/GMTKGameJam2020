extends Node2D


var plane_rotation = 0
var plane_tilt = 0
var wind_direction := Vector2(0,0)

func _ready():
	signal_emitter.connect("add_to_plane_rotation", self, "_on_add_to_plane_tilt")
	signal_emitter.connect("set_plane_rotation", self, "_on_set_plane_tilt")
	signal_emitter.connect("add_to_plane_tilt", self, "_on_add_to_plane_tilt")
	signal_emitter.connect("set_plane_tilt", self, "_on_set_plane_tilt")

func _on_add_to_plane_rotation(rot):
	plane_rotation += rot

func _on_set_plane_rotation(rot):
	plane_rotation = rot

func _on_add_to_plane_tilt(tilt):
	plane_tilt += tilt

func _on_set_plane_tilt(tilt):
	plane_tilt = tilt
