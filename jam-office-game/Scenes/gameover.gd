extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menumain.tscn") # Replace with function body.


func _on_give_up_pressed() -> void:
	get_tree().quit() # Replace with function body.