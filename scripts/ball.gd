extends Area2D

@export var speed_x = 100
@export var speed_y = 0

func _ready():
	position.x = 320
	position.y = 240

func move_ball(delta):
	position.x += speed_x * delta
	position.y += speed_y * delta

func _process(delta):
	move_ball(delta)

func _on_area_entered(area: Area2D) -> void:
	speed_x = -speed_x
