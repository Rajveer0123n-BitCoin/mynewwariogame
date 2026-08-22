extends Node2D

func _ready() -> void:
	print("Losing screen loaded. Waiting 10 seconds...")
	

	#YOOO WSP CODE CHECKER
	
	
	
	
	await get_tree().create_timer(10.0).timeout
	print("Returning to main UI...")
	get_tree().change_scene_to_file("res://titlescreen.tscn")
