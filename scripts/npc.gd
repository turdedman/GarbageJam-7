extends RigidBody2D

var canTalkWithNpc: bool = true

var placedAllBoxes: bool = false
var payedNPC: bool = false

var fixingClock: bool = false
var fixedClock: bool = false

var walkingToClock: bool = false

@export var speed: float = 100
	
@export var targetPositionMarker: Marker2D

@export var playerBody: Node2D
@export var textLabel: Label
@export var currentObjectiveLabel: Label



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if canTalkWithNpc:
		
		if get_parent().get_node("Clock").boxesOnBrokenClock == 8:
			placedAllBoxes = true
		
		
		if $Area2D.overlaps_body(playerBody):
			textLabel.show()
			if !placedAllBoxes:
				currentObjectiveLabel.text = "Current Objective:
				Collect and place all the boxes on the clock (drop with 'Q')"
			elif !payedNPC:
				currentObjectiveLabel.text = "Current Objective:
				Collect all the coins and pay the guy so he can fix the clock (Enter to pay when close to him)"
			elif fixingClock:
				currentObjectiveLabel.text = "Current Objective:
					Wait for the guy to fix the clock"
				
				walkingToClock = true
					
				canTalkWithNpc = false
		
			###paying the npc###
			
			if get_parent().get_node("GameManager").coins == get_parent().get_node("GameManager").totalcoins:
				if Input.is_action_pressed("enter") && fixingClock == false && fixedClock == false && payedNPC == false:
					fixingClock = true
					
					get_parent().get_node("GameManager").coins = 0
					get_parent().get_node("GameManager").totalcoins = 0
					
					get_parent().get_node("GameManager").pickup_item_label.text = "Coins: 0/0"
					
					payedNPC = true
					
			
			#####################

		
		else:
			textLabel.hide()
			
	else: #for when the npc is fixing/have fixed the clock#
		
		if fixingClock == true:
			
			textLabel.text = ""
			
			if walkingToClock:
				$AnimatedSprite2D.play("walk")
				
				$AnimatedSprite2D.look_at(targetPositionMarker.global_position)
				$AnimatedSprite2D.rotation -= 90
				

				linear_velocity = (targetPositionMarker.global_position - self.global_position).normalized() * speed
				
				walkingToClock = false
			
			if global_position.distance_to(targetPositionMarker.global_position) < 10:
				
				linear_velocity = Vector2(0, 0)
				
				walkingToClock = false
				$AnimatedSprite2D.play("idle")
				
				fixingClock = false
				fixedClock = true
				
				$AudioStreamPlayer2D.play()
				$Timer.start()
				
				
				


func _on_timer_timeout() -> void:
	get_parent().get_node("Clock").npcFixedClock = true
