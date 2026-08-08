extends Node2D

var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	# Starts a 7-second timer directly in code (no extra node required!)
	await get_tree().create_timer(7.0).timeout
	timer_end = true


func _process(delta: float) -> void:
	if buttons_pressed == 4:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
	
	if timer_end:
		timer_end = false # Resets flag so it doesn't run multiple times
		Global.lives -= 1
		Global.minigames_done -= 1
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
