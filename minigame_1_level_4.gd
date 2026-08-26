extends Node2D
@onready var player: CharacterBody2D = $Player
var stars_collected: int = 0
var total_stars: int = 3
var can_exit: bool = false
var level_cleared: bool = false

func _ready() -> void:
	print("Level 4 initialized!")
	$Player.SPEED = 350.0 
	$Player.JUMP_VELOCITY = -500.0

func add_stars() -> void:
	stars_collected += 1
	print("Stars collected: ", stars_collected)
	
	if stars_collected >= total_stars:
		can_exit = true
		print("All stars collected failureee! The exit door is now unlocked! Get out u FAiLURE!")

func _on_stararea_1_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("star1/stararea1"):
			$"star1/stararea1".set_deferred("monitoring", false)
		if has_node("star1"):
			$star1.queue_free()
		add_stars()
func _on_stararea_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("star2/stararea2"):
			$"star2/stararea2".set_deferred("monitoring", false)
		if has_node("star2"):
			$star2.queue_free()
		add_stars()

func _on_stararea_3_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("star3/stararea3"):
			$"star3/stararea3".set_deferred("monitoring", false)
		if has_node("star3"):
			$star3.queue_free()
		add_stars()

func _on_fallzone_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_cleared = true
		print("U fell into the pit stoobid! Going to losing screen...")
		get_tree().change_scene_to_file("res://losingscreen.tscn")



func _on_exit_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if can_exit:
			level_cleared = true
			print("Level 4 Cleared!")
			get_tree().change_scene_to_file("res://winningscreen_2.tscn")
		else:
			print("Door locked stoobid! u need to collect all 3 stars first.")

func _on_dragonhitbox_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_cleared = true
		print("You stoobid lah, the dragon got u.! Sending to u to jesus...")
		get_tree().change_scene_to_file("res://losingscreen.tscn")
