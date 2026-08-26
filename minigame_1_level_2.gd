extends Node2D

@onready var timer_label: RichTextLabel = $TimerLabel
var can_exit: bool = false
var stars_collected: int = 0
var total_stars: int = 2

var time_left: float = 10.0
var level_cleared: bool = false

func _ready() -> void:
	print("Level 2 initialized!")

func _process(delta: float) -> void:
	if not level_cleared:
		time_left -= delta
		
		if timer_label:
			timer_label.text = "%.1f" % max(0.0, time_left)
		
		if time_left <= 0:
			level_cleared = true
			print("Time's up! Opening losing screen...")
			get_tree().change_scene_to_file("res://losingscreen.tscn")

func add_stars() -> void:
	stars_collected += 1
	print("Stars collected: ", stars_collected)
	can_exit = true
	if stars_collected >= total_stars:
		print("All stars collected! Head to the exit gate!")
func _on_exit_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if stars_collected >= total_stars:
			level_cleared = true
			get_tree().change_scene_to_file("res://winning_screen.tscn")
		else:
			print("Exit locked! You need to collect all stars first.")

func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("starrrr2_!1"):
			$"starrrr2_!1".queue_free()
		add_stars()


func _on_area_2d_44_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("starrr2233"):
			$starrr2233.queue_free()
		add_stars()


func _on_enemyspawn_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_cleared = true
		print("The ghost got you! Sent to losing screen...")
		get_tree().change_scene_to_file("res://losingscreen.tscn")
