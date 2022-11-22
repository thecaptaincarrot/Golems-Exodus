extends Area2D


export var type = "Scene"
signal scene
onready var main_node = get_node("/root/Main")

var scenes_path = "res://Scenes/"
export var biome = "desert"
export(String) var target_scene #leave blank if not going to a scene

export (PackedScene) var Messenger

var target_scene_path = ""

export var message_text = "SAMPLE TEXT"
# Called when the node enters the scene tree for the first time.
func _ready():
	target_scene_path = scenes_path + biome + "/" + target_scene


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_PointOfInterest_area_entered(area):
	print("found spot with type: " + type)
	if type == "Scene":
		print("trying to go to " + target_scene_path)
		main_node.DecisionShow(target_scene_path)
	elif type == "Message":
		var message_show = Messenger.instance()
		call_deferred("add_child",message_show)
		message_show.get_node("Label").text = message_text
	elif type == "Reveal":
		pass
	else:
		print("invalid type")
		#oh lord
