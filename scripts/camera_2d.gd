extends Camera2D

@export var speed = 200

var mainScene: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mainScene = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var playerPosition: Vector2 = mainScene.get_node("Player").position
	
	var velocityVector2 = playerPosition - position

	if (position.distance_to(playerPosition) > 100):
		position += velocityVector2.normalized() * speed * delta
