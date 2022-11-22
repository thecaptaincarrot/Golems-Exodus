extends Button


signal change_population
signal change_golems
signal change_motivation
signal change_food

signal next_scene
signal back_to_map

export var delta_food = 0
export var delta_motivation = 0
export var delta_population = 0
export var delta_golems = 0

export var target_scene_path = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DecisionButton_pressed():
	if delta_food != 0:
		emit_signal("change_food",delta_food)
	if delta_motivation != 0:
		emit_signal("change_motivation",delta_motivation)
	if delta_population != 0:
		emit_signal("change_population",delta_population)
	if delta_golems != 0:
		emit_signal("change_golems",delta_golems)
	
	print("deltas: " + str(delta_food) + "," + str(delta_motivation) + "," + str(delta_population) + "," + str(delta_golems))
	
	emit_signal("back_to_map")
	
	#when a decision button is pressed, send a signal two places: 
	#1. send it to the tribe in the decision screen to change population or other things.
	#2. send it to the decision window so it can delete all children buttons and load next screen
