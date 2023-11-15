extends Area2D

var cruise_speed:float = 60

var cruising:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if cruising:
		position.y += cruise_speed * delta
	
	if position.y > -40: visible = true




func damage():
	$Sprite2D.visible = false
	#Death sfx
	#explostion sfx
	$DeathCountdown.start()


func _on_death_countdown_timeout():
	queue_free()



func _on_jiggle_timer_timeout():
	pass # Replace with function body.
