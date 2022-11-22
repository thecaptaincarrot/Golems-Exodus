extends Path2D

export (PackedScene) var messenger
export (PackedScene) var POI

#special points of interest declared below
export (PackedScene) var ArcologyCollapsePOI

onready var follow = $Follow

export var _motivation = 1.0
var base_speed = 20

var motivation_adjusted_speed = 1.0
var speed_factor = 1.0

var follow_exists = true

var move = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var tribe_node = get_node("/root/Main/Tribe")
	_motivation = tribe_node.motivation
	#pull motivation from tribe right now
	if move:
		if _motivation >.75 and _motivation < 1.25:
			speed_factor = 1
		elif _motivation <= .75:
				speed_factor = clamp((2.0 / 3.0) * _motivation + .5, .5, 1)
		elif _motivation >= 1.25:
			speed_factor = clamp((2.0 / 3.0) * _motivation + .1666667,1,2)
			
			
		motivation_adjusted_speed = speed_factor * base_speed
		if follow_exists:
			follow.set_offset(follow.get_offset() + motivation_adjusted_speed * delta)
			$Follow/TribeArea.rotation = -$Follow.rotation
			if $Follow.unit_offset >=0.99:
				$Follow.queue_free()
				follow_exists = false
		
	

	


func _draw():
	draw_polyline(curve.get_baked_points(), Color(1,0,0,1), 4.0)


func send_message(text):
	var message = messenger.instance()
	message.get_node("Label").text = str(text)
	$Follow/TribeArea.add_child(message)
	
	message._show()

func add_POI(type = "", scene = "", message = "", offset = 0.0, biome = ""):
	#This script places the POI at a certain offset.
	#POIs require a biome to properly point to a location
	#At some point it will have to figure out what Biome it's being placed in
	#once biomes get defined in game.
	var newFollow = PathFollow2D.new()
	call_deferred("add_child",newFollow)
	newFollow.offset = offset
	
	var newPOI = POI.instance()
	newFollow.call_deferred("add_child",newPOI)
	newPOI.target_scene = scene
	newPOI.biome = biome
	newPOI.type = type
	newPOI.message_text = message


func add_arcology_collapse_POI(offset = 0.0):
	var newFollow = PathFollow2D.new()
	call_deferred("add_child",newFollow)
	newFollow.offset = offset
	
	var newPOI = ArcologyCollapsePOI.instance()
	newFollow.call_deferred("add_child",newPOI)


func start_move():
	move = true
	
func stop_move():
	move = false
