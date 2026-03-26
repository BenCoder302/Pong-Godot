extends Area2D

@export var speed_x = 100
@export var speed_y = 0
@onready var timer = $BallTimer

func reset_ball():
	position.x = 320
	position.y = 240

func wait():
	timer.start()

func _ready():
	reset_ball()
	
func move_ball(delta):
	position.x += speed_x * delta
	position.y += speed_y * delta

func _process(delta):
	move_ball(delta)
	check_score()

func _on_area_entered(area: Area2D) -> void:
	speed_x = -speed_x

func check_score():
	if position.x <= 0:
		GameState.increment_enemy_score()
		reset_ball()
	if position.x >= 640:
		GameState.increment_player_score()
		reset_ball()
