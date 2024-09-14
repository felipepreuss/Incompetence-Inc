extends Papel

@onready var name_label =  $NameLabel
@onready var item_label = $ItemLabel
@onready var value_label = $ValueLabel
@onready var nationality_label = $NationalityLabel
# Lists of valid and invalid data for customs declarations
var first_names = ["John", "Jenny", "Barbara", "Tom", "Daphne", "Jimmy", "Sarah", "Brad", "Dale", "Jeff", "Anna", "Lily",
					"Mieke", "Hannah", "Laurence", "Oliver", "Sofia", "Louis", "Muhammad", "Steffan", "Harry", "Rebecca", "Sebastian",
					"Simone", "Mike", "Angelina", "Marcus", "Alan", "Richard", "Helen", "Daniel", "Fern", "Joaquin", "Lorna"]

var surnames = ["Peterson", "Bacon", "Liebermann", "Brown", "Woodson", "Rodriguez", "Jones", "Wilson", "Aarons", "Brocklehurst",
				"Broadbent", "Potter", "Cooper", "Carr", "Daniels", "Williams", "Schultz", "Santos", "Monroe", "Watson", "Neals",
				"MacDonald", "Cain", "Archer", "Richards", "Bishop", "Butcher", "Stark", "Mueller", "Fischer", "Schneider",
				"Wainwright", "Baker", "Smith", "Bauer", "Jaeger", "Ziegler"]

var items = ["Laptop", "Clothes", "Souvenirs", "Food Items", "Medicines", "Electronics", "Jewelry", "Sports Equipment", "Toys", "Books"]

var invalid_items = ["Firearms", "Illegal Drugs", "Exotic Animals", "Endangered Species Products", "Explosives"]

var nationalities = ["American", "British", "German", "French", "Chinese", "Indian", "Japanese", "Brazilian", "Canadian", "Australian"]

var invalid_nationalities = ["Unknownlandian", "FakeCountryian", "InvalidNational"]

var declared_values = [100, 200, 500, 1000, 1500]

var invalid_declared_values = [-50, 0, 10000]

var difficulty = 0
 
const BASE_FAKE_VALUE = 6

# Declare UI components


# Function to set the difficulty level
func set_difficulty(new_difficulty):
	difficulty = new_difficulty

# Function to generate a customs declaration
func generate_declaration():
	var first_name = pick_random_from_list(first_names) + " "
	var surname = pick_random_from_list(surnames)
	var item = pick_random_from_list(items)
	var declared_value = pick_random_from_list(declared_values)
	var nationality = pick_random_from_list(nationalities)

	var is_declaration_valid = true
	var value = randi_range(1, BASE_FAKE_VALUE + 1 + difficulty)

	# Randomly decide if the declaration will be incorrect
	if value >= BASE_FAKE_VALUE:
		is_declaration_valid = false

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
	var declaration_text = "Name: " + full_name
	var item_text = "Item: " + item
	var value_text = "Declared Value: $" + str(declared_value)
	var nationality_text = "Nationality: " + nationality

	# Update text fields with generated data
	name_label.text = declaration_text
	item_label.text = item_text
	value_label.text = value_text
	nationality_label.text = nationality_text

# Helper function to pick a random element from a list
func pick_random_from_list(list):
	return list[randi_range(0, list.size() - 1)]
