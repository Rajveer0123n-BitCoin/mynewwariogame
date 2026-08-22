extends Node2D

#this..goooddd



var stars_collected: int = 0
var total_stars: int = 2
func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$starr2/Area2D3.set_deferred("monitoring", false)
		$starr2.queue_free()
		add_stars()
func add_stars() -> void:
	stars_collected += 1
	print("stars collected: ", stars_collected)
	if stars_collected >= total_stars:
		print("You won! Switching to minigame 1, level 2, btw, its harder lol...")
		get_tree().change_scene_to_file("res://minigame_1_level_2.tscn")



func _on_area_2_ddd_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$starr/Area2ddd.set_deferred("monitoring", false)
		$starr.queue_free()
		add_stars()
