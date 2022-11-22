extends Path2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	send_stars_to_position(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func send_stars_to_position(time):
	var sun_path = $SunFollow
	var moon_path = $MoonFollow
	
	#25 offset is to deal with dawn being 00
	sun_path.unit_offset = (time + 25) / 100 + .5
	moon_path.unit_offset = (time + 25) / 100
