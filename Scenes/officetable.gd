extends Node2D
var paper_limit = 5
var paper_count = 0
var document = preload("res://Scenes/paper.tscn")
@onready var time = $Timer/timeleft
@onready var texto = $Timer
@onready var data = Data.get_node("Color/Anim")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data.play("Out")
	$Delay.start()
func _physics_process(delta: float) -> void:
	print(Global.dia)
	print(Global.dia_i)
	$Money.text = str("$",Global.dinheiro,",00")
	if Global.dinheiro >= Global.data_dinheiro[Global.dia - 1]:
		Global.dinheiro = Global.data_dinheiro[Global.dia - 1]
		data.play("In")
		Global.dia += 1
		Global.dia_i += 1
		if get_tree():
			get_tree().change_scene_to_file("res://day_transition.tscn")
		else:
			print("Erro: árvore de cena não disponível.")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer_text()

#func _on_keyboard_pressed() -> void:
	#get_tree().change_scene_to_file("res://Scenes/Computer.tscn") # Replace with function body.

func timer_text():
	texto.text = str(floor(time.time_left))
func spawn() -> void:
	paper_count += 1
	var obtain = document.instantiate()
	add_child(obtain)
	obtain.position = Vector2(randf_range(250,1000),randf_range(239,390)) # Replace with function body.
	$Delay.start()

func _on_delay_timeout() -> void:
	spawn()
	if paper_count >= paper_limit:
		paper_count = 0
