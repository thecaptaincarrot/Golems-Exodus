extends Panel


var label_desired_bottom_y = 527
var label_bottom_right_x = 436

var label_x_position = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	
	self.rect_size.x = $Label.rect_size.x + 40
	self.rect_size.y = $Label.rect_size.y + 40
	
	self.rect_position.x = 25
	self.rect_position.y = 507 - self.rect_size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
