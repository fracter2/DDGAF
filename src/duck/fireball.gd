extends Node2D

var speed = 350



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta
	
	if position.y < -40:
		queue_free()
