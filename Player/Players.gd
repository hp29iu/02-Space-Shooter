extends Node2D

var Player = preload("res://Player/Player.tscn")

func _physics_process(_delta):
	if get_child_count() == 0:
		var p = Player.instance()
		p.position = Vector2(512,300)
		add_child(p)
