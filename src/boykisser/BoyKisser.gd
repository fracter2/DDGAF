extends Area2D

@export var speed:float = 120

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target_pos:Vector2 
	if get_node_or_null("../../Player") != null:
		target_pos = $"../../Player".position
		position = position.move_toward(target_pos,speed * delta)




func damage():
	$Sprite2D.visible = false
	#Death sfx
	#explostion sfx
	%DeathCountdown.start()


func _on_death_countdown_timeout():
	queue_free()
