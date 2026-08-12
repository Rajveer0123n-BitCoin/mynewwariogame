extends Node2D

var stars_collected: int = 0
var total_stars: int = 2

func add_stars() -> void:
	stars_collected += 1
	print("Stars collected: ", stars_collected)
	
	if stars_collected >= total_stars:
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
	



	
