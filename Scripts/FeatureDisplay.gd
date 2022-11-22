extends Node2D

#This has to take several variables in order to actually be useful.
#First is bottom row size, which will automatically mean that the second row
#will be one less, etc.
#Second is hex-width, since they're drawn in a Hex Pattern
#Finally is number and then the actual sprite scene

#Max 4 rows for necessity's sake. excess is thrown away.

#Everything is exported because fuck you
export var row_width = 5
export var hex_width = 64
var hex_height = hex_width * 1.1547005

export var number_to_draw = 1

export (PackedScene) var ToDraw


# Called when the node enters the scene tree for the first time.
func _ready():
	if ToDraw:
		var position_list = create_hex_positions()
		for i in range(0,number_to_draw):
			var pog = ToDraw.instance()
			add_child(pog)
			if i < position_list.size():
				pog.position = position_list[i] + $Position2D.position
			else:
				pog.queue_free()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func create_hex_positions():
	#create all necessary 
	var position_list = Array()
	var maximum_size = row_width * 4 -2
	
	var limit1 = row_width
	var limit2 = row_width * 2 -1
	var limit3 = row_width * 3 -1
	var hardlimit = row_width * 4 -2
	for i in range(0,maximum_size):
		if i > hardlimit:
			break
		var new_position = Vector2()
		if i < limit1:
			new_position.y = 0
			new_position.x = i * hex_width
		elif i < limit2:
			new_position.y = -1 * hex_height
			new_position.x = (i + .5 - limit1) * hex_width
		elif i < limit3:
			new_position.y = -2 * hex_height
			new_position.x = (i - limit2) * hex_width
		else:
			new_position.y = -3 * hex_height
			new_position.x = (i + .5 - limit3) * hex_width
		
		print (new_position)
		position_list.append(new_position)
	return position_list
