extends Area2D

@onready var game_manager = %GameManager


func _ready():
	$GameOverTimer.timeout.connect(_on_timer_timeout)
	
func _on_timer_timeout():
	game_manager.call_deferred("change_scene", "res://scenes/game_over_scene.tscn")
