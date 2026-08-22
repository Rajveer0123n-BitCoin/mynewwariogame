extends Node2D
var level_cleared = false
func _ready() -> void:
	print("MINIGAME 2, installed")
	$Player.SPEED = 350.0 
	$Player.JUMP_VELOCITY = -500.0
func _on_udedfallzone_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_cleared = true
		print("U fell into the pit stoobid! Going to losing screen...")
		get_tree().change_scene_to_file("res://losingscreen.tscn")
func _on_areaenemy_1_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_cleared = true
		print("You stoobid lah, the ghost got u.! Sent to losing screen...")
		get_tree().change_scene_to_file("res://losingscreen.tscn")
func _on_areaenemy_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_cleared = true
		print("You stoobid lah, the ghost got u.! Sent to losing screen...")
		get_tree().change_scene_to_file("res://losingscreen.tscn")

	
