extends Node2D


var NumberOfBirbs = 1
export (PackedScene) var Birb

# Called when the node enters the scene tree for the first time.
func _ready():
	NumberOfBirbs = randi() % 5 + 1
	print(NumberOfBirbs)
	for i in range(0,NumberOfBirbs):
		var pog = Birb.instance()
		var pos = Vector2()
		add_child(pog)
		if i == 0:
			pos.x = 0
			pos.y = 0
			pog.position = pos
			
		elif i == 1:
			pos.x = -16.457
			pos.y = -26.478
			pog.position = pos
			pog.flip_h = true
		elif i == 2:
			pos.x = -32.422
			pos.y = -2.161
			pog.position = pos
			
		elif i == 3:
			pos.x = 21.614
			pos.y = -23.235
			pog.position = pos
		elif i == 4:
			pos.x = -32.962
			pos.y = -41.067
			pog.position = pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
