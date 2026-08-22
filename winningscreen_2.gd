extends Node2D

func _ready() -> void:
	print("Winning screen (2) loaded ,ehh, looks like ur smart, minigame number 2 time steven (or whatever ur name is)...")
	
	await get_tree().create_timer(5.0).timeout
	
	print("Level 3 failure management time...")
	get_tree().change_scene_to_file("res://minigame_2.tscn")
