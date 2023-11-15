extends Node2D

var cruise_speed:float = 60
var cruising:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not cruising:
		return
	
	position.y += cruise_speed * delta
	
	if position.y > 512:
		queue_free()
	
	if position.y > -512:
		visible = true
