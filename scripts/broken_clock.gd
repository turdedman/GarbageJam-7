extends Area2D

@export var targetBody: Node2D

@export var placedBoxScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var bodies = get_overlapping_bodies()
	
	if targetBody in bodies:
		
		if Input.is_action_pressed("drop"):
			if targetBody.boxInInventory == true:
				targetBody.boxInInventory = false
				targetBody.inventoryEmpty = true
				
				targetBody.get_node("Box").hide()
				
				var placedBox = placedBoxScene.instantiate()
				
				
				
				get_parent().add_child(placedBox)
				
				get_parent().placedBoxes.append(placedBox)
	
				
				placedBox.global_position = targetBody.global_position
				
				get_parent().boxesOnBrokenClock += 1
			
		
