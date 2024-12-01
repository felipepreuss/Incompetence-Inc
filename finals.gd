extends Control

func _ready() -> void:
	Data.get_node("Color/Anim").play("Out")

func _on_button_pressed() -> void:
	Data.get_node("Color/Anim").play("In")
	get_tree().change_scene_to_file("res://Scenes/menumain.tscn")
func _on_button_2_pressed() -> void:
	Data.get_node("Color/Anim").play("In")
	get_tree().quit()
