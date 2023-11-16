extends Area2D

const BORDER_RIGHT:int = 516 - 40
const BORDER_LEFT:int = 40
const BORDER_BOTTOM:int = 516 - 40
const BORDER_TOP:int = 400

@export var move_speed = 220

const fireball_preload = preload("res://src/duck/fireball.tscn")
var fireballs_ready:int = 3

var hp:int = 0
var isMusicOn = false




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hp >= 0:
	
		position.x += Input.get_axis("moveLeft", "moveRight") * move_speed * delta
		position.y += Input.get_axis("moveUp", "moveDown") * move_speed * delta
	
		position.x = clamp(position.x, BORDER_LEFT, BORDER_RIGHT)
		position.y = clamp(position.y, BORDER_TOP, BORDER_BOTTOM)
		#print("aa")
	
		if Input.is_action_just_pressed("fire") and fireballs_ready > 0:
			$AudioStreamPlayer2D.play()
			var fireball = fireball_preload.instantiate()
			fireball.position = position
			fireball.connect("hit", fireball_gained)
			
			get_parent().add_child(fireball)
			fireballs_ready -= 1
			update_blipps()

func fireball_gained():
	fireballs_ready += 1
	update_blipps()

func update_blipps():
	if fireballs_ready > 0:  get_node("Fireball Blipp1").visible = true
	else: get_node("Fireball Blipp1").visible = false
	if fireballs_ready > 1:  get_node("Fireball Blipp2").visible = true
	else: get_node("Fireball Blipp2").visible = false
	if fireballs_ready > 2:  get_node("Fireball Blipp3").visible = true
	else: get_node("Fireball Blipp3").visible = false




# if it gets damaged
func _on_area_entered(area):
	# take damage
	area.damage(2)
	hp -= 1
	$hurtSfx.play()
	$"UI Layer".take_damage()
	
	if hp == 2:
		# TODO: first dmg sound
		pass
	if hp == 1:
		# TODO: secpmd dmg sound
		pass
	
	# Deaths
	if hp <= 0:
		$"../Lose Screen".visible = true
		
		if $"../EnemyManager/Vaporeon".active == true:
			# killed by vaporeon sgfx
			pass 
		
		else:
			#flatline
			pass
		
		monitorable = false




func _on_start_timer_timeout():
	hp = 3
	visible = true
