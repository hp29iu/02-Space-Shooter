extends KinematicBody2D


var VP = null
export var speed = 5.0
var velocity = Vector2.ZERO
var points = 5

func _ready():
	VP = get_viewport().size
	velocity = Vector2(randf()*speed,0).rotated(randf()*2*PI)
	position.x = randf()*VP.x
	position.x = randf()*VP.y
	
func die():
	Global.level += 0.1
	Global.change_score(points)
	queue_free()

func _physics_process(_delta):
	position += velocity
	position.x = wrapf(position.x,0,VP.x)
	position.y = wrapf(position.y,0,VP.y)
	


func _on_Area2D_body_entered(body):
	if body.has_method("die"):
		body.die()
