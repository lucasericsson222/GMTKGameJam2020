extends Node2D


var plane_rotation = 0
var plane_tilt = 0
var wind_direction := Vector2(0,0)
var altitude

func _ready():
	Music._play_dif("game")
	set_altitude(100000)
	signal_emitter.connect("add_to_plane_rotation", self, "_on_add_to_plane_rotation")
	signal_emitter.connect("set_plane_rotation", self, "_on_set_plane_rotation")
	signal_emitter.connect("add_to_plane_tilt", self, "_on_add_to_plane_tilt")
	signal_emitter.connect("set_plane_tilt", self, "_on_set_plane_tilt")
	signal_emitter.connect("add_to_altitude", self, "_on_add_to_altitude")

func _process(delta):
	calculate_altitude(plane_rotation, plane_tilt)
	if altitude <= 0:
		get_tree().change_scene("res://game_over.tscn")

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

func set_altitude(alt):
	altitude = alt
	signal_emitter.emit_signal("altitude_changed", altitude)
	
func add_to_altitude(alt):
	altitude += alt
	signal_emitter.emit_signal("altitude_changed", altitude)

func _on_add_to_altitude(alt):
	altitude += alt
	signal_emitter.emit_signal("altitude_changed", altitude)

func calculate_altitude(rot, tilt):
	var alt = 0
	if rot > 0:
		alt -= int(rot * 50)
	elif rot < 0:
		alt -= -int(rot * 50)
	if (tilt > 60):
		alt -= 10
	elif tilt < 0:
		alt -= -int(tilt * 25)
	elif tilt >= 0:
		alt += int(tilt / 10)
		
	add_to_altitude(alt)
