extends CanvasLayer

var hp:int = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func take_damage():
	hp -= 1
	if hp == 2: 
		$HP3.visible = false
		
	if hp == 1: 
		$HP2.visible = false
	
	if hp == 0: 
		$HP1.visible = false


func _on_button_play_button_down():
	visible = true
