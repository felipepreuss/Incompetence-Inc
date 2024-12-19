extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/officetable.tscn") # Replace with function body.
	Global.dinheiro = 0

func _on_give_up_pressed() -> void:
	get_tree().quit() # Replace with function body.


func _on_retry_mouse_entered() -> void:
	$Hover.play()# Replace with function body.


func _on_give_up_mouse_entered() -> void:
	$Hover.play() # Replace with function body.


func _on_give_up_focus_entered() -> void:
	$Pressed.play() # Replace with function body.


func _on_retry_focus_entered() -> void:
	$Pressed.play() # Replace with function body.


func _on_backto_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menumain.tscn") # Replace with function body.
	Global.dinheiro = 0

func _on_backto_menu_focus_entered() -> void:
	$Pressed.play() # Replace with function body.


func _on_backto_menu_mouse_entered() -> void:
	$Hover.play() # Replace with function body.
