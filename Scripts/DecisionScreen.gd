 extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	hide()
	#change_scene("res://Scenes/SampleScene.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func change_scene(next_scene):
	var next_scene_object #for storing the object of the target scene after the scene changes
	
	var next_scene_button1
	var next_scene_button2
	var next_scene_button3
	
	#Tell sceneworld to change the biome. I think it should be handled by the container itself
	$SceneWorld.set_biome("desert") #at some point need to set biome areas on the map.
	#Load Scene Root Object
	next_scene_object = load(next_scene).instance()
	add_child(next_scene_object)
	
	$SceneWorld._time_of_day = get_parent().time
	print("time:" + str($SceneWorld._time_of_day))
	
	next_scene_object.name = "SceneRoot"
	
	next_scene_button1 = next_scene_object.get_node("DecisionMaker/Decision1")
	next_scene_button2 = next_scene_object.get_node("DecisionMaker/Decision2")
	next_scene_button3 = next_scene_object.get_node("DecisionMaker/Decision3")
	_make_decision_connections(next_scene_button1, next_scene_button2, next_scene_button3)
	
	
	#check what's up

func return_to_map():
	#scene should already be deleted??? fuck. try to delete them again
	if has_node("SceneRoot"):
		$SceneRoot.queue_free()
		print ("freed scene")
	get_parent().change_window("Map")
	

func _make_decision_connections(button1, button2, button3):
	var sceneroot = button1.get_parent().get_parent()
	
	print(sceneroot.name)
	
	button1.connect("next_scene", self, "change_scene")
	button2.connect("next_scene", self, "change_scene")
	button3.connect("next_scene", self, "change_scene")
	
	button1.connect("back_to_map", self, "return_to_map")
	button2.connect("back_to_map", self, "return_to_map")
	button3.connect("back_to_map", self, "return_to_map")
	
	button1.connect("next_scene", sceneroot, "free_self")
	button2.connect("next_scene", sceneroot, "free_self")
	button3.connect("next_scene", sceneroot, "free_self")
#
#	button1.connect("back_to_map", sceneroot, "free_self")
#	button2.connect("back_to_map", sceneroot, "free_self")
#	button3.connect("back_to_map", sceneroot, "free_self")
	
	button1.connect("change_food", get_parent().get_node("Tribe"), "change_food")
	button1.connect("change_motivation", get_parent().get_node("Tribe"), "change_motivation")
	button1.connect("change_population", get_parent().get_node("Tribe"), "change_population")
	button1.connect("change_golems", get_parent().get_node("Tribe"), "change_golems")
	
	button2.connect("change_food", get_parent().get_node("Tribe"), "change_food")
	button2.connect("change_motivation", get_parent().get_node("Tribe"), "change_motivation")
	button2.connect("change_population", get_parent().get_node("Tribe"), "change_population")
	button2.connect("change_golems", get_parent().get_node("Tribe"), "change_golems")
	
	button3.connect("change_food", get_parent().get_node("Tribe"), "change_food")
	button3.connect("change_motivation", get_parent().get_node("Tribe"), "change_motivation")
	button3.connect("change_population", get_parent().get_node("Tribe"), "change_population")
	button3.connect("change_golems", get_parent().get_node("Tribe"), "change_golems")
		
		
		
		
		
		
		
