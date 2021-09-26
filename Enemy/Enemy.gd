extends KinematicBody2D

var VP = null
var direction = 0
var dir_speed = 0.01

var Enemy_Bullet = preload("res://Bullet/Enemy_Bullet.tscn")
var Bullets = null
var points = 10

func _ready():
	VP = get_viewport().size
	position.x = randf()*VP.x
	position.y = randf()*VP.y

func _physics_process(_delta):
	direction += dir_speed
	

func die():
	Global.level += 0.2
	Global.change_score(points)
	queue_free()

func _on_Timer_timeout():
	if Bullets == null:
		Bullets = get_node_or_null("/root/Game/Bullets")
	if Bullets != null:
		var e = Enemy_Bullet.instance()
		e.position = position + Vector2(38,0).rotated(direction)
		e.rotation = direction
		Bullets.add_child(e)


func _on_Area2D_body_entered(body):
	if body.has_method("die"):
		body.die()
