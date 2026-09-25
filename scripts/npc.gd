extends RigidBody2D

var canTalkWithNpc: bool = true

var placedAllBoxes: bool = false
var payedNPC: bool = false

var fixingClock: bool = false
var fixedClock: bool = false





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
					
				canTalkWithNpc = false
		
			###paying the npc###
			
			if get_parent().get_node("GameManager").coins == get_parent().get_node("GameManager").totalcoins:
				if Input.is_action_pressed("enter") && fixingClock == false && fixedClock == false && payedNPC == false:
					fixingClock = true
					payedNPC = true
					
			
			#####################

		
		else:
			textLabel.hide()
			
	else: #for when the npc is fixing/have fixed the clock#
		
		if fixingClock == true:
			pass
		
		
