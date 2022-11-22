extends AnimatedSprite


var animation_delay = 10

var animation_options = ["Idle","Peck","LookAround",]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	#every 5-10 seconds, play a random animation
	pass


func AnimationTimer():
	animation = animation_options[randi() % animation_options.size()]


func _on_Birb_animation_finished():
	animation = "Idle"
	animation_delay = (randi() % 6) + 5
	$Timer.wait_time = float(animation_delay)
