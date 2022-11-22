extends Node2D

#Ths script builds a procedural route based on hard points.
#Hard point transforms are based on the relative position from the overmap node
#path Jitter "soft points" are placed every 20 units, +/-10 perpendicular along route
#Soft points are not placed when within 40 units of next hard point

#Hard points are sent to it from the outside

export (PackedScene) var PointOfInterest
export (PackedScene) var MapPath

onready var MapScreen = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	var arcology_position = MapScreen.get_node("OverMap/Arcology").position
	var passage_position = MapScreen.get_node("OverMap/PassageOfGibol").position
	
	var StartingPath = build_new_path([arcology_position,arcology_position + Vector2(0,60.0),
			 arcology_position + Vector2(20.0,60.0),passage_position - Vector2(50,-50),
			 passage_position,passage_position + Vector2(50,-50),
			passage_position + Vector2(100,-100)])
	
	
	
	StartingPath.add_arcology_collapse_POI(400.0)
	StartingPath.add_POI("Scene", "LowFood.tscn", "", 600.0, "desert")
	StartingPath.add_POI("Scene", "BirdsFromHeaven.tscn", "", 700.0, "desert")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func build_new_path(hard_points = [Vector2(0.0,0.0),]):
	var final_points = set_points(hard_points)
	print(final_points[len(final_points)-1])
	
	var new_MapPath = MapPath.instance()
	call_deferred("add_child",new_MapPath)
	
	for i in range(0, len(final_points)):
		new_MapPath.curve.add_point(final_points[i])
	
	MapScreen.connect("SendMessage",new_MapPath,"send_message")
	MapScreen.connect("start_move",new_MapPath,"start_move")
	MapScreen.connect("stop_move",new_MapPath,"stop_move")
	
	return new_MapPath


func set_points(hard_points = [Vector2(0.0,0.0),]):
	#hard_points is a list of all hard points as vector2's
	#returns a list of vector2's of all hard and soft points
	var num_hard_points = len(hard_points)
	var n = 0 #for building final point list
	var final_points = []
	
	for i in range(0 , len(hard_points) - 1): #Don't parse the very last hardpoint
		#1, put the hard point into the list because you should
		final_points.append(hard_points[i])
		n += 1
		
		var distance = hard_points[i].distance_to(hard_points[i+1])
		if distance < 80:
			pass
		else:
			var num_soft_points = round(distance/40) - 1
			for h in range(1,num_soft_points):
				var soft_point = hard_points[i]
				soft_point = soft_point.move_toward(hard_points[i+1],float(40 * h))
				#Apply Jitter Vector, do something better some day
				var jitter = Vector2(float(randi()%20),float(randi()%20))
				soft_point += jitter
				
				final_points.append(soft_point)
				n += 1
	
	#To-do: Add Smoothing
	
	final_points.append(hard_points[len(hard_points)-1])
	return final_points
	
