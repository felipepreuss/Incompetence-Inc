extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$credcredre.play() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_return_menu_pressed() -> void:
	 
	get_tree().change_scene_to_file("res://Scenes/menumain.tscn") # Replace with function body.
	$credcredre.stop()
	

func _on_return_menu_mouse_entered() -> void:
	$VBoxContainer/Return_menu/HoverC.play() # Replace with function body.

 
# Replace with function body.


func _on_return_menu_focus_entered() -> void:
	$VBoxContainer/Return_menu/PressedC.play() # Replace with function body.
