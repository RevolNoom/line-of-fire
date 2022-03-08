extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/Commander".SetCommander($Commander)
	yield(get_tree().create_timer(2.0), "timeout")
	var move = Move.new()
	$Commander.Do(move)
	var shoot = Shoot.new()
	$"/root/ForgottenRealm".add_child(shoot)
	$Commander.Do(shoot)

