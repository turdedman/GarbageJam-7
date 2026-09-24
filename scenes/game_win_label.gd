extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.label_visibility_changed.connect(_on_visibility_changed)


func _on_visibility_changed(is_visible: bool):
	visible = is_visible
