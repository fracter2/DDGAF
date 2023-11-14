extends Node2D

var speed = 350

signal hit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed * delta
	
	if position.y < -40:
		despawn()


func _on_area_entered(area):
	area.damage()
	despawn()
	
	


func despawn():
	hit.emit()
	queue_free()
