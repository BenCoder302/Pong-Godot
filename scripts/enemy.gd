extends Area2D

@export var speed = 200

func _ready():
	visible = true
	reset_enemy()

func _process(delta):
	if GameState.game_over:
		visible = false
	if Input.is_action_pressed("ui_w"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_s"):
		position.y += speed * delta
	
	if position.y >= 480 - 60:
		position.y = 480 - 60 
	if position.y <= 0 + 60:
		position.y = 0 + 60

func reset_enemy():
	position.y = 240
	position.x = 640 - 17/2
