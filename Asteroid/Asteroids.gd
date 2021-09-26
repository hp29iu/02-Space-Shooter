extends Node2D

var Asteroid = preload("res://Asteroid/Asteroid.tscn")

func _physics_process(_delta):
	if get_child_count() < floor(Global.level):
		var a = Asteroid.instance()
		add_child(a) 
