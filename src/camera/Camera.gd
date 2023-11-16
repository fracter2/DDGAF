extends Camera2D

@onready var target_pos:Vector2 = global_position 
@onready var target_zoom:Vector2 = zoom

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dist :float = global_position.distance_squared_to(target_pos)
	global_position = global_position.move_toward(target_pos, dist * dist* delta + dist * delta + delta) # dist*dist + dist +
	var zoom_d:float = zoom.distance_squared_to(target_zoom) 
	zoom = zoom.move_toward(target_zoom, zoom_d * zoom_d* delta + zoom_d* delta + delta) # zoom_d*zoom_d + zoom_d +
