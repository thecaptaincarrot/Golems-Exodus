extends Path2D

export (PackedScene) var messenger

onready var follow = $Follow

export var _motivation = 1.0
var base_speed = 60

var motivation_adjusted_speed = 1.0
var speed_factor = 100.0

var move = true
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
		
		follow.set_offset(follow.get_offset() + motivation_adjusted_speed * delta)
		
		$Follow/TribeArea.rotation = -$Follow.rotation
	


func _draw():
	draw_polyline(curve.get_baked_points(), Color(1,0,0,1), 4.0)


func send_message(text):
	var message = messenger.instance()
	message.get_node("Label").text = str(text)
	$Follow/TribeArea.add_child(message)
	
	message._show()
