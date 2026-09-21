extends CharacterBody2D


@export var speed: float = 180
@onready var animated_sprite: AnimatedSprite2D = %AnimatedSprite2D #Skapade en @onready var för animated_sprite med ett unikt namn så att man inte råkar fucka upp något senare
	

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
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
		
	look_at(get_global_mouse_position())
	rotation += PI / 2 # Ändrade 3.14 till PI så att det blir mer noggrant (Godot har inbyggd PI värde)
	
	velocity = velocityVector.normalized() * speed

	move_and_slide()
