extends Area2D

@export var speed = 200

func _ready():
	GameState.reset_score()
	visible = true
	reset_player()

func _process(delta):
	if GameState.game_over:
		visible = false
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	
	if position.y >= 480 - 60:
		position.y = 480 - 60 
	if position.y <= 0 + 60:
		position.y = 0 + 60

func reset_player():
	position.y = 240
	position.x = 17/2
