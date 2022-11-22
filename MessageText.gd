extends Control


export var text_to_display = ""
onready var tween = get_node("Tween")

# Called when the node enters the scene tree for the first time.
func _ready():
	#Put at Center
	_show()



func _process(delta):
	if tween.is_active() == false:
		queue_free()
	

func _show():
	var length = $Label.rect_size.x
	var desired_x = -length / 2
	rect_position.x = desired_x
	
	tween.interpolate_property($Label, "rect_position",
		Vector2(0, 0), Vector2(0, -20), 1.5,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property($Label, "custom_colors/font_color",
		Color(1,0,0,1), Color(1,0,0,0), 1.5,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
