extends Area2D

@export var speed_x = 0
@export var speed_y = 0
@onready var player = get_parent().get_node("Player")
@onready var enemy = get_parent().get_node("Enemy")

func _ready():
	visible = true
	reset_ball()

func _process(delta):
	if GameState.game_over:
		visible = false
		stop_ball()
	move_ball(delta)
	check_score()

func _on_area_entered(area: Area2D) -> void:
	speed_x = -speed_x

	if position.y > area.position.y + 10:
		speed_y = 150
	elif position.y < area.position.y - 10:
		speed_y = -150
	else:
		speed_y = 0

func check_score():
	if position.x <= 0:
		GameState.increment_enemy_score()
		reset_ball()

	if position.x >= 640:
		GameState.increment_player_score()
		reset_ball()

func stop_ball():
	speed_x = 0
	speed_y = 0

func move_ball(delta):
	position.x += speed_x * delta
	position.y += speed_y * delta
	if position.y >= 480 - 15 or position.y <= 0 + 15:
		speed_y = -speed_y

func reset_ball():
	stop_ball()
	player.reset_player()
	enemy.reset_enemy()
	position.x = 320
	position.y = 240
	await get_tree().create_timer(2).timeout
	speed_x = 300
