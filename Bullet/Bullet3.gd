extends Area2D

var VP = null
var velocity = Vector2.ZERO
var accel = 0.01

func _ready():
	VP = get_viewport().size

func _physics_process(_delta):
	position += velocity.rotated(rotation)
	velocity.y -= accel
	if position.x > VP.x or position.x < 0 or position.y > VP.y or position.y < 0:
		queue_free()
		


func _on_Bullet3_body_entered(body):
	if body.name != "Player":
		if body.has_method("die"):
			body.die()
		queue_free()
