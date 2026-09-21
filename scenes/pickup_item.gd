extends Area2D
#Taget från en tutorial

@onready var game_manager = %GameManager

func _ready():
	body_entered.connect(_on_body_entered)
	
	
func _on_body_entered(body):
	if body.name == "Player":
		var tween = create_tween()
		
		tween.tween_property(self, "position", position + Vector2(0, -20), 0.3)
		tween.tween_property(self, "modulate:a", 0.0, 0.3)
		game_manager.add_coin()
		#removes the coin node
		tween.tween_callback(self.queue_free)
		queue_free()
