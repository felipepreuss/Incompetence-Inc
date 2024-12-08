extends Papel

# Lists of valid and invalid data for customs declarations
var first_names = ["John", "Jenny", "Barbara", "Tom", "Daphne", "Jimmy", "Sarah", "Brad", "Dale", "Jeff", "Anna", "Lily",
					"Mieke", "Hannah", "Laurence", "Oliver", "Sofia", "Louis", "Muhammad", "Steffan", "Harry", "Rebecca", "Sebastian",
					"Simone", "Mike", "Angelina", "Marcus", "Alan", "Richard", "Helen", "Daniel", "Fern", "Joaquin", "Lorna"]

var surnames = ["Peterson", "Bacon", "Liebermann", "Brown", "Woodson", "Rodriguez", "Jones", "Wilson", "Aarons", "Brocklehurst",
				"Broadbent", "Potter", "Cooper", "Carr", "Daniels", "Williams", "Schultz", "Santos", "Monroe", "Watson", "Neals",
				"MacDonald", "Cain", "Archer", "Richards", "Bishop", "Butcher", "Stark", "Mueller", "Fischer", "Schneider",
				"Wainwright", "Baker", "Smith", "Bauer", "Jaeger", "Ziegler"]

var items = ["Laptop", "Clothes", "Souvenirs", "Food Items", "Medicines", "Electronics", "Jewelry", "Sports Equipment", "Toys", "Books"]

var invalid_items = ["Firearms", "Illegal Drugs", "Exotic Animals", "Endangered Species", "Explosive Device"]

var nationalities = ["American", "British", "German", "French", "Chinese", "Indian", "Japanese", "Brazilian", "Canadian", "Australian"]

var invalid_nationalities = ["Unknownlandian", "FakeCountryian", "InvalidNational", "Carioca", "Corinthians", "Indn"]

var invalid_declared_values = [-50, 0]

var difficulty = 0
 
const BASE_FAKE_VALUE = 6

var piscou = 0
# Declare UI components
@onready var name_label = $NameLabel
@onready var item_label = $ItemLabel
@onready var value_label = $ValueLabel
@onready var nationality_label = $NationalityLabel

#Declare Texture components
#@onready var doc = $"."
#var textura = [preload("res://Sprites/customsdec_realstamp.png"),
#preload("res://Sprites/customsdec2.png"), 
#preload("res://Sprites/customsdec_fakestamp.png")]
func _draw() -> void:
	filter_function()

func filter_function():
	generate_declaration()
	set_difficulty(1)
# Function to set the difficulty level
func set_difficulty(new_difficulty):
	difficulty = new_difficulty

# Function to generate a customs declaration
func generate_declaration():
	var first_name = pick_random_from_list(first_names) + " "
	var surname = pick_random_from_list(surnames)
	var item = pick_random_from_list(items)
	var declared_value = pick_random_from_list(Global.declared_values)
	var nationality = pick_random_from_list(nationalities)
	var value_paper = randi_range(0,2)
	#doc.texture = textura[value_paper]
	#if value_paper >= 1:
		#is_declaration_valid = false
	var value = randi_range(1, BASE_FAKE_VALUE + 1 + difficulty)
	# Randomly decide if the declaration will be incorrect
	#if value >= BASE_FAKE_VALUE:
		#is_declaration_valid = false

	match value:
		BASE_FAKE_VALUE:
			# Incorrect item
			item = pick_random_from_list(invalid_items)
		BASE_FAKE_VALUE + 1:
			# Incorrect declared value
			declared_value = pick_random_from_list(invalid_declared_values)
		BASE_FAKE_VALUE + 2:
			# Incorrect nationality
			nationality = pick_random_from_list(invalid_nationalities)
	
	var full_name = first_name + surname
	var declaration_text = full_name
	var item_text =  item
	var value_text = "$" + str(declared_value)
	var nationality_text =  nationality
	
	if invalid_items.has(item) or invalid_nationalities.has(nationality) or invalid_declared_values.has(declared_value):
		is_declaration_valid = false

	# Update text fields with generated data
	name_label.text = declaration_text
	item_label.text = item_text
	value_label.text = value_text
	nationality_label.text = nationality_text
	Global.valor = declared_value
# Helper function to pick a random element from a list
func pick_random_from_list(list):
	return list[randi_range(0, list.size() - 1)]


func _on_modulated_timeout() -> void:
	$Pisca.start()


func _on_pisca_timeout() -> void:
	piscou += 1
	if modulate.a <= 0.7:
		modulate.a += 0.1
	elif modulate.a >= 0.7:
		
		modulate.a -= 0.1
	if piscou >= 25:
		queue_free()
		Global.dinheiro -= 300
