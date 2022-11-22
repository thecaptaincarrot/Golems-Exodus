extends Node2D

#Ths script builds a procedural route based on hard points.
#Hard point transforms are based on the relative position from the overmap node
#path Jitter "soft points" are placed every 20 units, +/-10 perpendicular along route
#Soft points are not placed when within 40 units of next hard point

#A new script will be needed each time to define specific hardpoints

onready var MapPath = $MapRoute
onready var MapScreen = get_parent()




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
