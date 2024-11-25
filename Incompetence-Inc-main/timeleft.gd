extends Timer
@onready var ticking = $TickSound

# Called when the node enters the scene tree for the first time.
func _ready():
	ticking.play() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	
	get_tree().change_scene_to_file("res://Scenes/gameover.tscn") # Replace with function body.
	
