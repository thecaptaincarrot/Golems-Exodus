extends "res://Scripts/PointOfInterest.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_PointOfInterest_area_entered(area):
	var arcology_node = get_parent().get_node("Arcology")
	var destroyed_texture = load("res://Sprites/Adam1.png")
	
	arcology_node.set_texture(destroyed_texture)
	pass
