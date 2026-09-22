extends Node2D
var hourglassScale: Vector2
var hourglassPos: Vector2
var hourglassMagnified: bool = false

func startgame() -> void:
	$HourGlass/CanvasLayer/Hourglass.get_node("AnimatedSprite2D").play("default")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hourglassScale = $HourGlass/CanvasLayer/Hourglass.scale
	hourglassPos = $HourGlass/CanvasLayer/Hourglass.position
	
	startgame()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hourglass_mouse_entered() -> void:
	if !hourglassMagnified:
		$HourGlass/CanvasLayer/Hourglass.scale = Vector2(3, 3)
		$HourGlass/CanvasLayer/Hourglass.position.x = get_viewport_rect().size.x/2
		$HourGlass/CanvasLayer/Hourglass.position.y = get_viewport_rect().size.y/2
		hourglassMagnified = true
	elif hourglassMagnified:
		$HourGlass/CanvasLayer/Hourglass.scale = hourglassScale
		$HourGlass/CanvasLayer/Hourglass.position = hourglassPos
		hourglassMagnified = false
		
		
