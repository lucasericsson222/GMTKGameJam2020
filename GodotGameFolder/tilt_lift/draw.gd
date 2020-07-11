tool
extends Sprite


func _draw():
	
	var polygon_array = PoolVector2Array([$left_corner.global_position, $right_corner.global_position, $right_middle.global_position, $left_middle.global_position])
	var color = Color("#FF331F")
	var colors = PoolColorArray([color])
	draw_polygon(polygon_array, colors)

func _process(delta):
	update()

