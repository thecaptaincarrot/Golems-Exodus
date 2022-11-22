extends Button

onready var TribeNode = get_node("/root/Main/Tribe")

signal change_population
signal change_golems
signal change_motivation
signal change_food

signal next_scene
signal back_to_map

export var button_direction = "Scene" #either scene or Map

export var delta_food = 0.0
export var delta_motivation = 0.0
export var delta_population = 0.0
export var delta_golems = 0.0

export var gate_food = 0
export var gate_motivation = 0
export var gate_population = 0
export var gate_golems = 0

export var target_scene_path = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	print (TribeNode.golems)
	print (gate_golems)
	print (TribeNode.golems < gate_golems)
	if TribeNode.food < gate_food or TribeNode.motivation < gate_motivation or TribeNode.population < gate_population or TribeNode.golems < gate_golems:
		disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):



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
	
	
	if button_direction == "scene":
		emit_signal("next_scene",target_scene_path)
		print("target location: " + target_scene_path)
	else:
		emit_signal("back_to_map")
	
	#when a decision button is pressed, send a signal two places: 
	#1. send it to the tribe in the decision screen to change population or other things.
	#2. send it to the decision window so it can delete all children buttons and load next screen
