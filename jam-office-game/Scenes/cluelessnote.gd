extends Sprite2D

var na_area = false  #se o mouse está na imagem
var pressionado = false #quando o jogador está com o mouse pressionado 
var seguir #quem o objeto vai seguir
var tamanho : Vector2 #tamanho do sprite
var center_offset : Vector2 #espaçamento para criar colisão


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
	else:
		pressionado = false
	if pressionado:
		if na_area:
			position.x= lerpf(position.x,mouse_pos.x,0.1)
			position.y= lerpf(position.y,mouse_pos.y,0.1)  
	elif seguir != null:
		position = seguir.global_position
		
		
	if mouse_pos.x < position.x + tamanho.x - center_offset.x\
	 and mouse_pos.x > position.x - center_offset.x\
	 and mouse_pos.y < position.y - center_offset.y + tamanho.y\
	 and mouse_pos.y > position.y - center_offset.y:
			na_area = true		
