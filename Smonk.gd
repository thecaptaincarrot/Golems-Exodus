extends Sprite


onready var tween = get_node("Tween")


# Called when the node enters the scene tree for the first time.
func _ready():
	tween.interpolate_property(self, "position",
		Vector2(00, -32), Vector2(-20, -122), 3.0,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.interpolate_property(self, "modulate", 
	Color(1, 1, 1, 1), Color(1, 1, 1, 0), 3.0, 
	Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
