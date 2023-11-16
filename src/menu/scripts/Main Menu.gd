extends ColorRect


func _ready():
	visible = true

func _on_button_play_button_down():
	queue_free()


func _on_player_area_entered(area):
	pass # Replace with function body.
