class_name Papel extends Sprite2D

var na_area = false  #se o mouse está na imagem
var pressionado = false #quando o jogador está com o mouse pressionado 
var seguir #quem o objeto vai seguir
var tamanho : Vector2 #tamanho do sprite
var center_offset : Vector2 #espaçamento para criar colisão
var no_corpo = false #Se o papel está na mesma posição da pasta
var no_trash = false #Se o papel foi descartado
@onready var tempo = $"../Timer/timeleft"
var is_declaration_valid = true
@onready var corpo_pos = $"../Manilafolder".global_position #Define a posição do papel pela pasta
@onready var trash_pos = $"../Shredder".global_position

@onready var doc = $"."
var textura = [preload("res://Sprites/customsdec_realstamp.png"),
preload("res://Sprites/customsdec2.png"), 
preload("res://Sprites/customsdec_fakestamp.png")]
@onready var marker = $ItemLabel/Marker
# Called when the node enters the scene tree for the first time.
var value_array:int
var val = false
var al_val = randi_range(0,1)
func _ready() -> void:
	marker.visible = false
	if Global.dia != 1:
		value_array = randi_range(0,2)
	elif Global.dia == 1:
		value_array = 1
	doc.texture = textura[value_array]
	match value_array:
		0:
			is_declaration_valid = true
		1:
			if Global.dia != 1:
				is_declaration_valid = false
		2,3: 
			is_declaration_valid = false
	if Global.dia >= 3:
		val = true
	if val:
		if al_val == 1:
			marker.visible = true
			is_declaration_valid = false
		else:
			marker.visible = false
			if value_array >= 1:
				is_declaration_valid = false
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
			if !is_declaration_valid:
				match Global.dia:
					5:
						Global.suborno = true
						var limit = 0
						if limit < 1:
							Global.suborno
							limit += 1
					6:
						Global.dia = 1
				if Global.dia != 5:
					get_tree().change_scene_to_file("res://Scenes/gameover.tscn")
			elif is_declaration_valid:
				Global.dinheiro += Global.valor
				tempo.start(tempo.time_left + randi_range(1,6))
		if no_trash:
			queue_free()
			if !is_declaration_valid:
				tempo.start(tempo.time_left + randi_range(1,6))
			elif is_declaration_valid:
				if Global.dia != 5:
					get_tree().change_scene_to_file("res://Scenes/gameover.tscn")
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
			no_trash = true
			$"../Shredder/InsertedTrash".play()
func _on_body(body: Node2D) -> void:
	if body.is_in_group("Folder"):
		no_corpo = true
	elif body.is_in_group("Lixo"):
		no_trash = true
func _off_body(area: Area2D) -> void:
	if area.is_in_group("Folder"):
		no_corpo = false
	elif area.is_in_group("Lixo"):
		no_trash = false
