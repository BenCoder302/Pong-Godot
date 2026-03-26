extends Area2D

@export var speed_x = 400
@export var speed_y = 0

func stop_ball():
	speed_x = 0
	speed_y = 0

func reset_ball():
	stop_ball()
	position.x = 320
	position.y = 240
	await get_tree().create_timer(1.5).timeout
	speed_x = 400

func _ready():
	visible = true
	reset_ball()
	
func move_ball(delta):
	position.x += speed_x * delta
	position.y += speed_y * delta

func _process(delta):
	if GameState.game_over:
		visible = false
		stop_ball()
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
