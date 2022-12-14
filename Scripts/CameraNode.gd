extends Node2D

export var sensitivity = 450

var _previousPosition: Vector2 = Vector2(0, 0);
var _moveCamera: bool = false;

onready var zoom = $Camera2D.zoom

var zoomspeed = 400.0
var zoommargin = 0.1

var zoompos = Vector2()
var zoomfactor = 1.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity =Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * sensitivity
	
	position += velocity * delta
	
	#zoom
	if abs($Camera2D.zoom.x - zoom.x * zoomfactor) >= .01:
		$Camera2D.zoom.x = lerp(zoom.x, zoom.x * zoomfactor, zoomspeed * delta)
		$Camera2D.zoom.y = lerp(zoom.y, zoom.y * zoomfactor, zoomspeed * delta)
	
#	if $Camera2D.zoom.y < 0.5 and $Camera2D.zoom.x < 0.5:
#		zoomfactor = 1.0
#
#	if $Camera2D.zoom.y > 2 and $Camera2D.zoom.x > 2:
#		zoomfactor = 1.0
	
	

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton && (event.button_index == BUTTON_RIGHT || event.button_index == BUTTON_MIDDLE):
		get_tree().set_input_as_handled();
		if event.is_pressed():
			_previousPosition = event.position;
			_moveCamera = true;
		else:
			_moveCamera = false;
	elif event is InputEventMouseMotion && _moveCamera:
		get_tree().set_input_as_handled();
		position += (_previousPosition - event.position);
		_previousPosition = event.position;
	
	
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_DOWN and ($Camera2D.zoom.y < 2 and $Camera2D.zoom.x < 2):
				zoomfactor += .01
				zoompos = get_global_mouse_position()
			elif event.button_index == BUTTON_WHEEL_UP and ($Camera2D.zoom.y > 0.5 and $Camera2D.zoom.x > 0.5) :
				zoomfactor -= .01
				zoompos = get_global_mouse_position()
	
