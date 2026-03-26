extends Area2D

@export var speed = 200

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	
	if position.y >= 480 - 60:
		position.y = 480 - 60 
	if position.y <= 0 + 60:
		position.y = 0 + 60
