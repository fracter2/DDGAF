extends Area2D

var cruise_speed = 60
var cruising = false
var active = false
var vourlnable:bool = false
var testies_spawned:int = 2
var testies_active: int = 0

var hp:int = 12
var hits_taken:int = 0

const testicle_preload = preload("res://src/vaporeon/testicle.tscn")
@onready var spawn_end_1 = $"spawnpoint1"
@onready var spawn_end_2 = $"spawnpoint2"
@onready var barrierr = $Barrierr


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cruising:
		position.y += cruise_speed * delta
		if position.y > 90:
			position.y = 90
			cruising = false
			active = true
			spawn_testicles(testies_spawned)
			testies_active = testies_spawned
			$Copypasta.play()
	
	if active and not vourlnable:
		pass
		
	elif vourlnable:
		# no barrier
		pass
	
	if position.y > -516: visible = true
	


func spawn_testicles(ammount:int):
	var spawn_offset:float = (spawn_end_2.global_position.x - spawn_end_1.global_position.x) / (1+ammount)
	
	var n:int = 1
	for i in range(ammount):
		var testicle = testicle_preload.instantiate()
		testicle.global_position = spawn_end_1.global_position
		testicle.global_position.x += spawn_offset * n
		$"..".add_child(testicle)
		
		
		n += 1
		testicle.connect("destroyed", testicle_destroyed)



func damage(ammount:int = 1): # to the vaporeor
	if vourlnable:
		hp -= ammount
		hits_taken += 1
	
	
	if hp <= 0:
		$Moahn.play()
		vourlnable = false
		$"Death Timer".start()
	
	elif hits_taken >= 3:
		vourlnable = false
		testies_spawned += 2
		hits_taken = 0
		
		spawn_testicles(testies_spawned)
		testies_active = testies_spawned
		
		barrierr.monitorable = true
		barrierr.visible = true
	
	


func testicle_destroyed():
	testies_active -= 1
	
	if testies_active <= 0:
		#monitorable = true
		vourlnable = true
		barrierr.monitorable = false
		barrierr.visible = false


func _on_death_timer_timeout():
	$"../../Win Screen".visible = true
	$"../../Player"
	
	#queue_free()
