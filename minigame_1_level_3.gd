extends Node2D
@onready var player: CharacterBody2D = $Player
@onready var timer_label: RichTextLabel = $TimerLabel  
var stars_collected: int = 0

var total_stars: int = 4


var can_exit: bool = false
var time_left: float = 20.0 
var level_cleared: bool = false

func _ready() -> void:
	print("Level 3 initialized!")
	#had a bit of a trouble here
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
			print("Time's up failuree! Going to losing screen...")
			get_tree().change_scene_to_file("res://losingscreen.tscn")

func add_stars() -> void:
	stars_collected += 1
	print("Stars collected: ", stars_collected)
	if stars_collected >= total_stars:
		can_exit = true
		print("All stars collected! Head to the exit zone. GO QUICKLY U FAILURE")
		

func _on_exit_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if can_exit:
			level_cleared = true
			get_tree().change_scene_to_file("res://minigame_1_level_4.tscn")
		else:
			print("why u such a failure,u need to collect all stars before exiting u stoobid")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("star2d/Area2D"):
			$star2d/Area2D.set_deferred("monitoring", false)
		if has_node("star2d"):
			$star2d.queue_free()
		add_stars()



func _on_area_2d_23_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("star2d2/Area2D23"):
			$star2d2/Area2D23.set_deferred("monitoring", false)
		if has_node("star2d2"):
			$star2d2.queue_free()
		add_stars()


func _on_area_2d_233_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("star2d3/Area2D233"):
			$star2d3/Area2D233.set_deferred("monitoring", false)
		if has_node("star2d3"):
			$star2d3.queue_free()
		add_stars()
func _on_area_2d_2333_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if has_node("star2d4/Area2D2333"):
			$"star2d4/Area2D2333".set_deferred("monitoring", false)
		if has_node("star2d4"):
			$star2d4.queue_free()
		add_stars()

func _on_fallzone_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		level_cleared = true
		print("u fell into the pit! haiya Going to losing screen...")
		get_tree().change_scene_to_file("res://losingscreen.tscn")
