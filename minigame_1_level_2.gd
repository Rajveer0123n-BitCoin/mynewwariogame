extends Node2D

var stars_collected: int = 0
var total_stars: int = 2

var time_left: float = 10.0
var level_cleared: bool = false

func _process(delta: float) -> void:
	# Only count down if the level hasn't been won yet
	if not level_cleared:
		time_left -= delta
		
		# Optional: If you add a Label named TimerLabel to your scene, this will update it
		if has_node("TimerLabel"):
			$TimerLabel.text = "Time: " + str(ceil(time_left))
		
		# If time runs out -> trigger losing screen
		if time_left <= 0:
			level_cleared = true # Stops process from running again
			print("Time's up! Loading losing screen...")
			get_tree().change_scene_to_file("res://losingscreen.tscn")

func add_stars() -> void:
	stars_collected += 1
	print("Stars collected: ", stars_collected)
	
	if stars_collected >= total_stars:
		level_cleared = true # Stops the timer so losing screen won't trigger!
		print("You won Level 2!")
		get_tree().change_scene_to_file("res://winning_screen.tscn")

# Signal from starr2_0 -> Area2d_22
func _on_area_2d_22_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("starr2_0/Area2d_22"):
			$starr2_0/Area2d_22.set_deferred("monitoring", false)
		if has_node("starr2_0"):
			$starr2_0.queue_free()
		add_stars()

# Signal from starrr2_!1 -> Area2D333
func _on_area_2d_333_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("starrr2_!1/Area2D333"):
			$"starrr2_!1/Area2D333".set_deferred("monitoring", false)
		if has_node("starrr2_!1"):
			$"starrr2_!1".queue_free()
		add_stars()
	



	
