extends Node2D

var speed = 350
var fireballsfx_preload = preload("res://src/duck/firebal_sfx.tscn")
signal hit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed * delta
	
	if position.y < -30:
		despawn()


func _on_area_entered(area):
	area.damage(1)
	despawn()
	
	


func despawn():
	hit.emit()
	var sfx = fireballsfx_preload.instantiate()
	get_parent().add_child(sfx)
	queue_free()
	# TODO HIT SOUIMD
