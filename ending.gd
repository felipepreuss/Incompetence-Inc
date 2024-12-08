extends Control
@onready var data = Data.get_node("Color/Anim")

func _ready():
	data.play("Out")
func _on_menu_pressed():
	data.play("In")
	get_tree().change_scene_to_file("res://Scenes/menumain.tscn")

func on_quit_pressed():
	data.play("In")
	get_tree().quit()
