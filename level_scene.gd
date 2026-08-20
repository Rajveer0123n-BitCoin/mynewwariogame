extends Node2D


@onready var lives_container: HBoxContainer = $livesContainer
@onready var lives_1: TextureRect = $livesContainer/lives
@onready var lives_2: TextureRect = $livesContainer/lives2
@onready var lives_3: TextureRect = $livesContainer/lives3
@onready var lives_4: TextureRect = $livesContainer/lives4
@onready var lives_5: TextureRect = $livesContainer/lives5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time: float

func _ready() -> void:
	# Start a 5-second timer on the main screen
	await run_timer(5.0)
	
	# After 5 seconds, move to minigame or main menu
	if Global.minigames_done < 3:
		Global.minigames_done += 1
		get_tree().change_scene_to_file("res://minigame_1.tscn")
	else:
		get_tree().change_scene_to_file("res://titlescreen.tscn")

func _process(_delta: float) -> void:
	# Hide heart icons depending on remaining lives
	match Global.lives:
		4:
			lives_5.hide()
		3:
			lives_5.hide()
			lives_4.hide()
		2:
			lives_5.hide()
			lives_4.hide()
			lives_3.hide()
		1:
			lives_5.hide()
			lives_4.hide()
			lives_3.hide()
			lives_2.hide()
		0:
			lives_container.hide()

	# Display current countdown and level number on screen
	timer.text = str(snapped(time, 0.1))
	level.text = "Try " + str(Global.minigames_done)

func run_timer(start_time: float) -> void:
	time = start_time
	while time > 0.0:
		await get_tree().create_timer(0.1).timeout
		time -= 0.1
