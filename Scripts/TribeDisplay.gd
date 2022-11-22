extends Node

export (PackedScene) var Adam
export (PackedScene) var Golem

export var hex_width = 16
var hex_height = hex_width * 1.1547005

#hex pattern is 8, 7, 8 etc

var adams = 0
var golems = 0

var adams_check = 0
var golems_check = 0
# Called when the node enters the scene tree for the first time.
# find how many people you have, then draw them 
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if adams != adams_check or golems != golems_check:
		redraw()
		adams_check = adams
		golems_check = golems


func redraw():
	#remove old golems and adams
	undraw()
	#Draw Adams
	for n in range(0,adams):
		#add visual meeple
		var pog = Adam.instance()
		var pos = Vector2()
		call_deferred("add_child",pog)
		#set position of dude
		#check how many you're at
		if n>= 30:
			pos.y = -4 * hex_height
			pos.x = ((n * hex_width) - 30 * hex_width)
		elif n >= 23:
			#4th row
			pos.y = -3 * hex_height
			pos.x = ((n + 0.5) * hex_width) - 23 * hex_width
		elif n >= 15:
			#3rd row
			pos.y = -2 * hex_height
			pos.x = (n * hex_width) - 15 * hex_width
		elif n >= 8:
			pos.y = -1 * hex_height
			pos.x = ((n + 0.5) * hex_width) - 8 * hex_width
		else:
			pos.y = 0
			pos.x = n*hex_width
		pog.position = $PointedLocation.position + pos
		
	#Draw Golems behind the Adams
	for n in range (0,golems):
		#add visual Golem
		var pog = Golem.instance()
		var pos = Vector2()
		add_child(pog)
		#set position of Golem
		#Golems start at hex position -1,0 and are grown vertically followed by horizontally
		#only 2 golems per row, max 8
		if n >= 6:
			pos.x = -3 * hex_width
			pos.y = (-n * 3 + 18.5) * hex_height * 1.5
		elif n >= 4:
			pos.x = -2.25 * hex_width
			pos.y = (-n * 3 + 12.5) * hex_height * 1.5
		elif n >= 2:
			pos.x = -1.5 * hex_width
			pos.y = (-n * 3 + 6.5) * hex_height * 1.5
		else:
			pos.x = -.75 * hex_width
			pos.y = (-n * 3 + .5) * hex_height * 1.5
		pog.position = $PointedLocation.position + pos

func undraw():
	for i in range(0,get_child_count()):
		if get_child(i) != $PointedLocation:
			get_child(i).queue_free()
