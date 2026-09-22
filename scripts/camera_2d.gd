extends Camera2D

@export var speed = 200
@export var zoomSpeed = 10

var mainScene: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mainScene = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("scroll in"):
		if zoom < Vector2(3, 3):
			zoom += Vector2(1, 1) * zoomSpeed * delta
	elif Input.is_action_just_pressed("scroll out"):
		if zoom > Vector2(1.5, 1.5):
			zoom += Vector2(1, 1) * -zoomSpeed * delta
	
	var playerPosition: Vector2 = mainScene.get_node("Player").position
	
	var velocityVector2 = playerPosition - position

	if (position.distance_to(playerPosition) > 100):
		position += velocityVector2.normalized() * speed * delta
