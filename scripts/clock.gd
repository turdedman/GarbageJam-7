extends Node

var placedBoxes: Array[Node]

var boxesOnBrokenClock: int = 0
var fixedClock = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if boxesOnBrokenClock >= 8 && fixedClock == false:
		$Clock.show()
		
		$BrokenClock.hide()
		
		$CPUParticles2D.emitting = true
		
		fixedClock = true
		
		for box in placedBoxes:
			box.queue_free.call_deferred()
		
		
