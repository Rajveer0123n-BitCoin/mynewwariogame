extends Node2D

func _ready() -> void:
	print("Winning screen loaded. Waiting 5 seconds...")
	
	# Pause code execution on this line for 5.0 seconds
	await get_tree().create_timer(5.0).timeout
	
	print("Level 3 time...")
	# Change this path to your main UI / menu scene file!
	get_tree().change_scene_to_file("res://minigame_1_level_3.tscn")
