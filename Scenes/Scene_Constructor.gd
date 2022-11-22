extends Control

#This needs to do few things based on exported variables:
#1. it needs to find the time of day, rotate, the skywheel, and set the darkness level
#2. Draw the terrain. this is entirely dependent on Biome.
#3. Draw scene features
#4. create the scene panel and tables
#9999. show an override graphic


export var _time_of_day = 0
var _feature_draw_function = "???" #ugh, how do I make this happen

signal biome

# Called when the node enters the scene tree for the first time.
func _ready():
	#tell the parent what biome to display
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func free_self(_args):
	queue_free()
	print("I tried to free myself")
