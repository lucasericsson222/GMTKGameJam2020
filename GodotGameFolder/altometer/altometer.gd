extends Node2D


onready var alt_label = $NinePatchRect/Label

func _ready():
	signal_emitter.connect("altitude_changed", self, "_on_altitude_changed")

func _on_altitude_changed(alt):
	alt_label.text = String(alt)
