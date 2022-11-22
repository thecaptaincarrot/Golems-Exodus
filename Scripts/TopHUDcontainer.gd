extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Gonna just check every frame until it becomes a problem.
	var Tribe_node = get_node("/root/Main/Tribe")
	$TopHUD/HUDLabels/FoodText.text = str(Tribe_node.food)
	$TopHUD/HUDLabels/PopulationText.text = str(Tribe_node.population)
	$TopHUD/HUDLabels/MoraleText.text = str(Tribe_node.motivation * 100) + "%"
	$TopHUD/HUDLabels/GolemsText.text = str(Tribe_node.golems)
