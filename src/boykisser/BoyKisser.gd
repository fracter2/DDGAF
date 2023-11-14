extends Area2D

var cruise_speed:float = 40

@export var speed:float = 120
var active:bool = false
var cruising:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		var target_pos:Vector2 
		if get_node_or_null("../../Player") != null:
			target_pos = $"../../Player".position
			position = position.move_toward(target_pos,speed * delta)
	
	elif cruising:
		position.y += cruise_speed * delta




func damage():
	$Sprite2D.visible = false
	#Death sfx
	#explostion sfx
	$DeathCountdown.start()


func _on_death_countdown_timeout():
	queue_free()




func _on_visible_on_screen_notifier_2d_screen_entered():
	active = true
