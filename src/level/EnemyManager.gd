extends Node2D




func _on_start_timer_timeout():
	for i in get_children():
		i.cruising = true
