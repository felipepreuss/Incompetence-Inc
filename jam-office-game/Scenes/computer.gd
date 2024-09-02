extends Control
var is_visible: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	is_visible = not is_visible
	$CanvasLayer/barstart.visible = is_visible   
	 
 
