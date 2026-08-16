extends Node2D

func _ready() -> void:
	print("Losing screen loaded. Waiting 10 seconds...")
	

	await get_tree().create_timer(10.0).timeout
	
	print("Returning to main UI...")
	# Change this path to your main UI / menu scene file!
	get_tree().change_scene_to_file("res://titlescreen.tscn")
