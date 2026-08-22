extends Node2D

func _ready() -> void:
	print("Winning screen loaded haiya, u such a failure..it took 19 tries to come here. Waiting 5 seconds...")
	
	await get_tree().create_timer(5.0).timeout
	
	print("Level 3 failure management time...")
	get_tree().change_scene_to_file("res://minigame_1_level_3.tscn")
