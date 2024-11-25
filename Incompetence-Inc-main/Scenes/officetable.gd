extends Node2D
var paper_limit = 5
var paper_count = 0
var pode_apertar = true
var document= preload("res://Scenes/paper.tscn")
@onready var time = $Timer/timeleft
@onready var texto = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Canvas.visible = false
func _physics_process(delta: float) -> void:
	print(Global.dia)
	objetivo()
	$Money.text = str("$",Global.dinheiro,",00")
	if Global.dinheiro >= Global.data_dinheiro[Global.dia - 1] and Global.dia <= 6:
		Global.dinheiro += Global.data_gasto[Global.dia - 1]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer_text()

func objetivo():
	$Canvas.visible = true
	match Global.dia:
		1:
			if Global.dinheiro >= Global.data_dinheiro[0]:
				$Canvas/Color/Anim.play("In")
		2:
			if Global.dinheiro >= Global.data_dinheiro[1]:
				$Canvas/Color/Anim.play("In")
		3:
			if Global.dinheiro >= Global.data_dinheiro[2]:
				$Canvas/Color/Anim.play("In")
		4:
			if Global.dinheiro >= Global.data_dinheiro[3]:
				$Canvas/Color/Anim.play("In")
		5:
			if Global.dinheiro >= Global.data_dinheiro[4]:
				$Canvas/Color/Anim.play("In")
		6:
			if Global.dinheiro >= Global.data_dinheiro[5]:
				$Canvas/Color/Anim.play("In")
#func _on_keyboard_pressed() -> void:
	#get_tree().change_scene_to_file("res://Scenes/Computer.tscn") # Replace with function body.

func timer_text():
	texto.text = str(floor(time.time_left))
func spawn_paper():
	if paper_count <= paper_limit:
		paper_count += 1
		var obtain = document.instantiate()
		obtain.global_position = Vector2(randf_range(50,1000),randf_range(200,450))
		add_child(obtain)
		$Delay.start()

func _on_delay_timeout() -> void:
	spawn_paper()
	if paper_count == paper_limit:
		paper_count = 0
