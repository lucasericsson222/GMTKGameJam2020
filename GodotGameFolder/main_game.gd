extends Node2D


var plane_rotation = 0
var plane_tilt = 0
var wind_direction := Vector2(0,0)

func _ready():
	signal_emitter.connect("add_to_plane_rotation", self, "_on_add_to_plane_rotation")
	signal_emitter.connect("set_plane_rotation", self, "_on_set_plane_rotation")
	signal_emitter.connect("add_to_plane_tilt", self, "_on_add_to_plane_tilt")
	signal_emitter.connect("set_plane_tilt", self, "_on_set_plane_tilt")

func _on_add_to_plane_rotation(rot, delta):
	plane_rotation += rot * delta / 10
	signal_emitter.emit_signal("rotation_changed", plane_rotation)

func _on_set_plane_rotation(rot):
	plane_rotation = rot
	signal_emitter.emit_signal("rotation_changed", plane_rotation)

func _on_add_to_plane_tilt(tilt, delta):
	plane_tilt += tilt * delta
	signal_emitter.emit_signal("tilt_changed", plane_tilt)

func _on_set_plane_tilt(tilt):
	plane_tilt = tilt
	signal_emitter.emit_signal("tilt_changed", plane_tilt)
