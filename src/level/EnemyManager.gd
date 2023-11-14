extends Node2D






func _on_button_play_button_down():
	for i in get_children():
		i.cruising = true
