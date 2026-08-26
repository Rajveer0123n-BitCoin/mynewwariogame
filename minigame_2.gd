extends Node2D
var level_cleared = false
var time_left: float = 20.0 
@onready var timer_label: RichTextLabel = $TimerLabel 
func _ready() -> void:
	print("MINIGAME 2, initialized")
	$Player.SPEED = 350.0 
	$Player.JUMP_VELOCITY = -500.0
func _process(delta: float) -> void:
	if not level_cleared:
		time_left -= delta
		
		
		if timer_label:
			timer_label.clear()
			timer_label.append_text("%.1f" % max(0.0, time_left))
		if time_left <= 0:
			level_cleared = true
			print("YOU SURVIVED, YAYY!!")
			get_tree().change_scene_to_file("res://winningscreen_3.tscn")	
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

	


func _on_areaenemy_3_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_cleared = true
		print("You stoobid lah, the ghost got u.! Sent to losing screen...")
		get_tree().change_scene_to_file("res://losingscreen.tscn")


func _on_areaenenemy_4_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_cleared = true
		print("You stoobid lah, the ghost got u.! Sent to losing screen...")
		get_tree().change_scene_to_file("res://losingscreen.tscn")	


func _on_areaenemy_5_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_cleared = true
		print("You stoobid lah, the ghost got u.! Sent to losing screen...")
		get_tree().change_scene_to_file("res://losingscreen.tscn")		


func _on_areaenemy_6_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_cleared = true
		print("You stoobid lah, the ghost got u.! Sent to losing screen...")
		get_tree().change_scene_to_file("res://losingscreen.tscn")	
