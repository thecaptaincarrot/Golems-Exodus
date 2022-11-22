extends Control


#export (PackedScene) var messenger
signal SendMessage

signal start_move
signal stop_move

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func send_message (text = ""):
	emit_signal("SendMessage",text)
