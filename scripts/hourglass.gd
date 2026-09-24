extends Area2D

@export var id: String = "hour_glass"
@onready var game_manager = %GameManager


func _ready():
	$GameOverTimer.timeout.connect(_on_timer_timeout)
	Global.destroy_requested.connect(_on_destroy_requested)
	
func _on_timer_timeout():
	game_manager.call_deferred("change_scene", "res://scenes/game_over_scene.tscn")

func _on_destroy_requested(target_id: String):
	if target_id == id:
		queue_free()
