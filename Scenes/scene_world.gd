extends Control

#This needs to do few things based on exported variables:
#1. it needs to find the time of day, rotate, the skywheel, and set the darkness level
#2. Draw the terrain. this is entirely dependent on Biome.
#3. Draw scene features
#4. create the scene panel and tables
#9999. show an override graphic

export var _biome = "desert"
export var _time_of_day = 0
var _feature_draw_function = "???" #ugh, how do I make this happen

export var time = 0

signal biome

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#tell the parent what biome to display
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#_time_of_day += delta * 10
	set_time (_time_of_day)

func set_time (time):
	$SkyBoxPath.send_stars_to_position(time)
	var alpha = clamp(.5 * cos(PI * (time + 25) / 50) + .2 , 0, .5)
	$DarkSkies.color = Color(0,0,.0625,alpha)

func set_biome(biome):
	if biome == "desert":
		$GroundBox.color = Color(0.93,.79,.55,1)
	elif biome == "forest":
		$GroundBox.color = Color(1,1,1,1)
		
func free_self(_args):
	queue_free()
