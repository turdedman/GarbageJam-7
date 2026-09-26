extends Node

var placedBoxes: Array[Node]

var boxesOnBrokenClock: int = 0

var npcFixedClock: bool = false
var fixedClock: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if npcFixedClock == true && fixedClock == false:
		Global.destroy_requested.emit("hour_glass")
		Global.label_visibility_changed.emit(true)
		$Clock.show()
		
		$BrokenClock.hide()
		
		$CPUParticles2D.emitting = true
		
		fixedClock = true
		
		get_parent().get_node("Npc").currentObjectiveLabel.text = ""
		
		for box in placedBoxes:
			box.queue_free.call_deferred()
			
		
		
		
