extends Node2D

@onready var timer_label: RichTextLabel = $TimerLabel

var stars_collected: int = 0
var total_stars: int = 2

var time_left: float = 10.0
var level_cleared: bool = false

func _ready() -> void:
	print("Level 2 initialized!")

func _process(delta: float) -> void:
	if not level_cleared:
		time_left -= delta
		
		# Safely updates RichTextLabel content
		if timer_label:
			timer_label.clear()
			timer_label.append_text("%.1f" % max(0.0, time_left))
		
		# If time runs out -> go to losing screen
		if time_left <= 0:
			level_cleared = true
			print("Time's up! Opening losing screen...")
			get_tree().change_scene_to_file("res://losingscreen.tscn")

func add_stars() -> void:
	stars_collected += 1
	print("Stars collected: ", stars_collected)
	
	if stars_collected >= total_stars:
		level_cleared = true # Freezes timer on win!
		print("You won Level 2!")
		get_tree().change_scene_to_file("res://winning_screen.tscn")

# Signal from starrr2_!1 -> Area2D333
func _on_area_2d_333_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("starrr2_!1/Area2D333"):
			$"starrr2_!1/Area2D333".set_deferred("monitoring", false)
		if has_node("starrr2_!1"):
			$"starrr2_!1".queue_free()
		add_stars()

# Signal from starrr2233 -> Area2d4321
func _on_area_2d_4321_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("starrr2233/Area2d4321"):
			$starrr2233/Area2d4321.set_deferred("monitoring", false)
		if has_node("starrr2233"):
			$starrr2233.queue_free()
		add_stars()



	



	
