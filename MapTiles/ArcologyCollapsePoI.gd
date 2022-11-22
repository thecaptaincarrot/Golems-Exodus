extends Area2D


export var type = "Scene"
signal scene
onready var main_node = get_node("/root/Main")

var scenes_path = "res://Scenes/"
export var biome = "desert"
export(String) var target_scene #leave blank if not going to a scene

export (PackedScene) var Messenger
export (PackedScene) var CollapsedArcology

var target_scene_path = ""

export var message_text = "SAMPLE TEXT"

signal destroy_arcology

onready var overmap = main_node.get_node("MapScreen/OverMap")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	target_scene_path = "res://Scenes/Desert/Arcology_collapses.tscn"


func _on_PointOfInterest_area_entered(area):
	print("found spot with type: " + type)
	if type == "Scene":
		print("trying to go to " + target_scene_path)
		main_node.DecisionShow(target_scene_path)
		
		var arcology_node = overmap.get_node("Arcology")
		var pos = arcology_node.position
		
		arcology_node.queue_free()
		
		var ruins = CollapsedArcology.instance()
		overmap.call_deferred("add_child",ruins)
		ruins.position = pos
		
		
	elif type == "Message":
		var message_show = Messenger.instance()
		call_deferred("add_child",message_show)
		message_show.get_node("Label").text = message_text
	elif type == "Reveal":
		pass
	else:
		print("invalid type")
		#oh lord
