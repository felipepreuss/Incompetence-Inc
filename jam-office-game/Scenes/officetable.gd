extends Node2D

var document= preload("res://Scenes/paper.tscn")
@onready var stack = $Pile
@onready var time = $Timer/timeleft
@onready var texto = $Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer_text()

func _on_keyboard_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Computer.tscn") # Replace with function body.

func timer_text():
	texto.text = str(floor(time.time_left))
	
func _on_pile_pressed() -> void:
	
	var obtain = document.instantiate()
	add_child(obtain)
	obtain.position = stack.position # Replace with function body.
	$Pile/AudioStreamPlayer2D.play()
