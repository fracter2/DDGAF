extends Node2D

var vibrating:bool = false
var k:float = 0

func _process(delta):
	if vibrating:
		k += delta
		vibration(k)


func _on_button_play_button_down():
	visible = true
	$StartTimer.start()
	$"../Camera2D".enabled = true
	$"../Camera2D".make_current()
	$AnimationPlayer.play("Cutscene")
	$VibrationTimer.start()
	$ZoomoutTimer.start()


func _on_start_timer_timeout():
	$BGMusic.play()
	visible = false
	


func vibration(k:float):
	$"Duck fake".position.x += randf_range(-k * 12, k * 12)
	$"Duck fake".position.y += randf_range(-k * 12, k * 12)
#	$"Duck fake".position.y += 10
#	position.y += randf_range(-k * 12, k * 12)
#	position.x += randf_range(-k * 12, k * 12)



func _on_vibration_timer_timeout():
	vibrating = true


func _on_zoomout_timer_timeout():
	$"../Camera2D".target_pos = Vector2(256, 256)
	$"../Camera2D".target_zoom = Vector2(1,1)
