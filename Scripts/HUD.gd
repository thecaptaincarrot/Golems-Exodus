extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	#Gonna just check every frame until it becomes a problem.
	$HUDlabels/FoodText.text = str(get_parent().get_parent().get_node("Tribe").food)
	$HUDlabels/PopulationText.text = str(get_parent().get_parent().get_node("Tribe").adam)
	$HUDlabels/MoraleText.text = str(get_parent().get_parent().get_node("Tribe").motivation)
	$HUDlabels/GolemsText.text = str(get_parent().get_parent().get_node("Tribe").golem)
	
