extends Label

func _process(delta: float) -> void:
	if GameState.player_score == 5:
		GameState.game_over = true
		text = "Player Wins\nPress Space to start again" 
		visible = true		
		
	if GameState.enemy_score == 5:
		GameState.game_over = true
		text = "Enemy Wins\nPress Space to start again" 
		visible = true		
	
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
		GameState.game_over = false
