extends Area2D

const BORDER_RIGHT:int = 516 - 40
const BORDER_LEFT:int = 40
const BORDER_BOTTOM:int = 516 - 40
const BORDER_TOP:int = 400

@export var move_speed = 220

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += Input.get_axis("moveLeft", "moveRight") * move_speed * delta
	position.y += Input.get_axis("moveUp", "moveDown") * move_speed * delta
	
	position.x = clamp(position.x, BORDER_LEFT, BORDER_RIGHT)
	position.y = clamp(position.y, BORDER_TOP, BORDER_BOTTOM)
	
	
	#if Input.get

