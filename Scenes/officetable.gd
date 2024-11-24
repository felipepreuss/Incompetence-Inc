extends Node2D
var paper_limit = 5
var paper_count = 0
var pode_apertar = true
var document= preload("res://Scenes/paper.tscn")
@onready var stack = $Pile
@onready var time = $Timer/timeleft
@onready var texto = $Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Canvas.visible = false
func _physics_process(delta: float) -> void:
	print(Global.dia)
	$Pile/DelayText.text = ""
	$Money.text = str("$",Global.dinheiro,",00")
	if Global.dinheiro >= Global.data_dinheiro[Global.dia - 1]:
		$Canvas.visible = true
		if $Canvas.visible:
			$Canvas/Color/Anim.play("In")
			$Canvas/Timer.start()
			Global.dinheiro += Global.data_gasto[Global.dia - 1]
			Global.dia += 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer_text()
	if !pode_apertar:
		$Pile/DelayText.text = str(int($Delay.time_left))


#func _on_keyboard_pressed() -> void:
	#get_tree().change_scene_to_file("res://Scenes/Computer.tscn") # Replace with function body.

func timer_text():
	texto.text = str(floor(time.time_left))
func _on_pile_pressed() -> void:
	if pode_apertar and paper_count <= paper_limit:
		pode_apertar = false
		paper_count += 1
		var obtain = document.instantiate()
		add_child(obtain)
		obtain.position = stack.position # Replace with function body.
		$Pile/AudioStreamPlayer2D.play()
		$Delay.start()

func _on_delay_timeout() -> void:
	pode_apertar = true
	if paper_count == paper_limit:
		paper_count = 0
