extends Node


var currentscreen = "Title"

export var time = 0 #time goes from 0 to 99. 25 is dawn, 50 is noon, 75 is dusk, 0 is midnight
var time_advance = false #time only advances on the map screen

var date = 1
signal DayOver
# Called when the node enters the scene tree for the first time.
func _ready():
	change_window("Title")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# NOTE: CHANGED SO THAT DAWN WAS 00 INSTEAD OF MIDNIGHT
func _process(delta):
	if time_advance == true:
		time = time + delta * 10
		if time > 99:
			time = 0.01
			date += 1
			Holiday_Check(date)
			
			emit_signal("DayOver")


func change_window(target):
	#target is a string, either "Decision", "Map" or "Title"
	#Disable all screens first
	disable_all_windows()
	
	if target == "Decision":
		#At some point we need to tell it what decision screen we're going to...
		
		$DecisionScreen.show()
		$DecisionScreen.set_process(true)
		
		$DecisionScreen/SceneWorld.set_time(time)
		
		$Tribe.draw_tribe = true
		$Tribe/TribeDisplay.redraw()
		
		$Camera2D.current = true
		
		$MapScreen.emit_signal("stop_move")
		
	elif target == "Title":
		$TitleScreen.show()
		$TitleScreen.set_process(true)
		
		$Camera2D.current = true
	elif target == "Map":
		$MapScreen.show()
		$MapScreen.set_process(true)
		$MapScreen/CameraNode/Camera2D.current = true
		$MapScreen/CameraNode.set_process(true)
		
		$MapScreen.emit_signal("start_move")
		
		time_advance = true
		
		
func disable_all_windows():
	$Camera2D.current = true
	#disable TitleScreen
	$TitleScreen.hide()
	$TitleScreen.set_process(false)
	#disable DecisionScreen
	$DecisionScreen.hide()
	$DecisionScreen.set_process(false)
	
	$Tribe/TribeDisplay.undraw()
	$Tribe.draw_tribe = false
	#disable MapScreen
	$MapScreen.hide()
	$MapScreen.set_process(false)
	$MapScreen/CameraNode.set_process(false)
	
	$MapScreen/CameraNode/Camera2D.current = false
	time_advance = false

func DecisionShow(target_scene):
	$DecisionScreen.change_scene(target_scene)
	change_window("Decision")
	


func ReturnTitleScreen():
	change_window("Title")


func MapShow():
	change_window("Map")

func Holiday_Check(date):
	#certain days are holy days! better find out which ones!
	if date == 2:
		DecisionShow("res://Scenes/HolyDays/FirstNight.tscn")
	else:
		pass

func starvation_check():
	var population = $Tribe.population
