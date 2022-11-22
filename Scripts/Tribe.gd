extends Node


export var population = 32
export var golems = 2

export var food = 100
export var motivation = 1

export var draw_tribe = false

onready var Main = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	$TribeDisplay.adams = population
	$TribeDisplay.golems = golems

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draw_tribe:
		$TribeDisplay.set_process(true)
	else:
		
		$TribeDisplay.set_process(false)
		
	if motivation < 0:
		motivation  = .5


func change_food(delta_food):
	food += delta_food


func change_golems(delta_golems):
	golems += delta_golems
	$TribeDisplay.golems = golems


func change_motivation(delta_motivation):
	motivation += delta_motivation


func change_population(delta_population):
	population += delta_population
	$TribeDisplay.adams = population


func _DayOver():
	food -= population
	if food <= 0:
		food = 0
		
		var deaths = population / 10
		population -= deaths
		motivation -= .1
		Main.get_node("MapScreen").send_message (str(deaths) + " of your people have starved")
		
		
	
	print("The Day Ends")
