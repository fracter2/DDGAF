extends TextureRect


func _ready():
	visible = true

func _on_button_play_button_down():
	queue_free()
