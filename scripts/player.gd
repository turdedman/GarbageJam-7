extends CharacterBody2D


@export var speed: float = 200

	

func _physics_process(delta: float) -> void:

	var velocityVector = Vector2(0, 0)

	if Input.is_action_pressed("W"):
		velocityVector.y = -1
	if Input.is_action_pressed("S"):
		velocityVector.y = 1
	if Input.is_action_pressed("A"):
		velocityVector.x = -1
	if Input.is_action_pressed("D"):
		velocityVector.x = 1
	
	if velocityVector != Vector2(0, 0):
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
		
	look_at(get_global_mouse_position())
	rotation += 3.14/2
	
	velocity = velocityVector.normalized() * speed

	move_and_slide()
