class_name Papel extends Sprite2D

var na_area = false  #se o mouse está na imagem
var pressionado = false #quando o jogador está com o mouse pressionado 
var seguir #quem o objeto vai seguir
var tamanho : Vector2 #tamanho do sprite
var center_offset : Vector2 #espaçamento para criar colisão
var no_corpo = false #Se o papel está na mesma posição da pasta
@onready var corpo_pos = $"../Manilafolder".global_position
@onready var trash_pos = $"../Shredder".global_position#Define a posição do papel pela pasta
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tamanho = Vector2(texture.get_width() * scale.x, texture.get_height() * scale.y)
	center_offset = Vector2(tamanho.x/2,tamanho.y/2)
 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	var mouse_pos = get_global_mouse_position()
	if Input.is_action_pressed("click"):
		pressionado = true
		if na_area:
			scale = Vector2(1.12,1.12)
		#$Shadow.visible = true
	if Input.is_action_just_released("click"):
		seguir = null
		na_area = false
		pressionado = false
		scale = Vector2(1,1)
		#$Shadow.visible = false
	if pressionado:
		if na_area:
			position.x= lerpf(position.x,mouse_pos.x,0.1)
			position.y= lerpf(position.y,mouse_pos.y,0.1)  
	elif seguir != null:
		global_position = seguir.global_position
	if !pressionado:
		if no_corpo:
			queue_free()
	if mouse_pos.x < position.x + tamanho.x - center_offset.x\
	 and mouse_pos.x > position.x - center_offset.x\
	 and mouse_pos.y < position.y - center_offset.y + tamanho.y\
	 and mouse_pos.y > position.y - center_offset.y:
		na_area = true
	elif  !pressionado:
		na_area = false
#Lógica do Papel
	if corpo_pos.x < position.x + tamanho.x - center_offset.x\
	 and corpo_pos.x > position.x - center_offset.x\
	 and corpo_pos.y < position.y - center_offset.y + tamanho.y\
	 and corpo_pos.y > position.y - center_offset.y:
		if pressionado:
			scale = Vector2(0.9,0.9)
		else:
			no_corpo = true
			$"../Manilafolder/Inserted".play()
	if trash_pos.x < position.x + tamanho.x - center_offset.x\
	and trash_pos.x > position.x - center_offset.x\
	and trash_pos.y < position.y - center_offset.y + tamanho.y\
	and trash_pos.y > position.y - center_offset.y:
		if pressionado:
			scale = Vector2(0.9,0.9)
		else:
			no_corpo = true
func _on_body(body: Node2D) -> void:
	no_corpo = true
	
func _off_body(area: Area2D) -> void:
	no_corpo = false
