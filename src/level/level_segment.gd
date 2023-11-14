extends Node2D

var cruise_speed:float = 40
var cruising:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not cruising:
		return
	
	position.y += cruise_speed
	
	if position.y < 0:
		queue_free()
