extends Area2D

const BORDER_RIGHT:int = 516 - 40
const BORDER_LEFT:int = 40
const BORDER_BOTTOM:int = 516 - 40
const BORDER_TOP:int = 200

@export var move_speed = 220

const fireball_preload = preload("res://src/duck/fireball.tscn")
var fireballs_ready:int = 3

var hp:int = 0
var isMusicOn = false
@export var has_won:bool = false

@onready var sprite1 = $Sprite2D
@onready var sprite2 = $Sprite2D2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite1.position.x = randf_range(-2, 2)
	sprite1.position.y = randf_range(-2, 2)
	sprite2.position.x = randf_range(-2, 2)
	sprite2.position.y = randf_range(-2, 2)
	
	if hp >= 0 and has_won != true:
	
		position.x += Input.get_axis("moveLeft", "moveRight") * move_speed * delta
		position.y += Input.get_axis("moveUp", "moveDown") * move_speed * delta
	
		position.x = clamp(position.x, BORDER_LEFT, BORDER_RIGHT)
		position.y = clamp(position.y, BORDER_TOP, BORDER_BOTTOM)
		#print("aa")
	
		if Input.is_action_just_pressed("fire") and fireballs_ready > 0 and has_won != true:
			if randi_range(0,9) < 9 : $Quack.play()
			else: $Quack.play()  #$Honk.play() // I couldn't implement the honk mp3 for some reason
			
			var fireball = fireball_preload.instantiate()
			fireball.position = position
			fireball.connect("hit", fireball_gained)
			
			get_parent().add_child(fireball)
			fireballs_ready -= 1
			
			# visuals
			update_blipps()
			$SpriteSwitchTimer.start()
			$Sprite2D2.visible = true
			$Sprite2D.visible = false
			

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
	if has_won: return # skips the rest
	
	# thorns attack damage
	area.damage(2)
	
	# take damage
	if hp > 0: hp -= 1
	
	$"UI Layer".take_damage()
	
	if hp == 2:
		$hurtSfx.play()
		pass
	if hp == 1:
		$InternalBleeding.play()
		pass
	
	# Deaths
	if hp <= 0:
		$"../Lose Screen".visible = true
		
		if $"../EnemyManager/Vaporeon".active == true:
			# killed by vaporeon sgfx
			$KilledByVaporeon.play()
		
		else:
			#flatline
			$Flatline.play()
		#setting the speed to 0 so duck doesn't get vaporeon spoiled when he dies before he gets to it
		move_speed = 0
		#this does not seem to stop the player from getting hit again, so temp fix that i found is to set has_won to true
		has_won = true
		monitorable = false




func _on_start_timer_timeout():
	hp = 3
	visible = true


func _on_sprite_switch_timer_timeout():
	$Sprite2D2.visible = false
	$Sprite2D.visible = true
