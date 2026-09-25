extends Area2D

@export var targetBody: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body == targetBody:
		if body.inventoryEmpty == true:
			
			body.get_node("Box").show()
			
			body.inventoryEmpty = false
			body.boxInInventory = true
			
			queue_free.call_deferred()
			
