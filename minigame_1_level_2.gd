extends Node2D

@onready var timer_label: RichTextLabel = $TimerLabel

var stars_collected: int = 0
var total_stars: int = 2

var time_left: float = 10.0
var level_cleared: bool = false

func _ready() -> void:
	print("Level 2 initialized!")
func _on_enemyspawn_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_cleared = true
		print("You stoobid lah, the ghost got u.! Sent to losing screen...")
		get_tree().change_scene_to_file("res://losingscreen.tscn")

func _process(delta: float) -> void:
	if not level_cleared:
		time_left -= delta
		
		
		if timer_label:
			timer_label.clear()
			timer_label.append_text("%.1f" % max(0.0, time_left))
		
		#yooo, hows the code?
	
		if time_left <= 0:
			level_cleared = true
			print("Time's up u failure! Opening losing screen...")
			get_tree().change_scene_to_file("res://losingscreen.tscn")

func add_stars() -> void:
	stars_collected += 1
	print("Stars collected: ", stars_collected)
	
	if stars_collected >= total_stars:
		level_cleared = true 
		print("u won Level 2! more like y won failure management")
		get_tree().change_scene_to_file("res://winning_screen.tscn")
func _on_area_2d_333_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("starrr2_!1/Area2D333"):
			$"starrr2_!1/Area2D333".set_deferred("monitoring", false)
		if has_node("starrr2_!1"):
			$"starrr2_!1".queue_free()
		add_stars()

func _on_area_2d_4321_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("starrr2233/Area2d4321"):
			$starrr2233/Area2d4321.set_deferred("monitoring", false)
		if has_node("starrr2233"):
			$starrr2233.queue_free()
		add_stars()
