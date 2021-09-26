extends KinematicBody2D

var VP = null
var velocity = Vector2.ZERO
var speed = 0.12
var rotation_speed = 2
var max_speed = 8

var Bullet = preload("res://Bullet/Bullet.tscn")
var Bullet2 = preload("res://Bullet/Bullet2.tscn")
var Bullet3 = preload("res://Bullet/Bullet3.tscn")
var Bullet4 = preload("res://Bullet/Bullet4.tscn")
onready var Bullets = get_node("/root/Game/Bullets")

func _ready():
	VP = get_viewport().size


func _physics_process(_delta):
	velocity += get_input()*speed
	velocity = clamp(velocity.length(),0,max_speed) * velocity.normalized()
	position += velocity
	position.x = clamp(position.x,0,VP.x)
	position.y = clamp(position.y,0,VP.y)
	

func get_input():
	var toReturn = Vector2.ZERO
	$Thrust.hide()
	if Input.is_action_pressed("up"):
		toReturn.y -= 0.5
		$Thrust.show()
	if Input.is_action_pressed("down"):
		toReturn.y += 0.5
	if Input.is_action_pressed("left"):
		rotation_degrees -= rotation_speed
	if Input.is_action_pressed("right"):
		rotation_degrees += rotation_speed
	if Input.is_action_just_pressed("shoot"):
		var bullet = Bullet.instance()
		bullet.position = position + Vector2(0,-5).rotated(rotation)
		bullet.rotation = rotation
		bullet.velocity.x = 5
		Bullets.add_child(bullet)
		bullet = Bullet.instance()
		bullet.position = position + Vector2(0,-5).rotated(rotation)
		bullet.rotation = rotation
		Bullets.add_child(bullet)
		bullet = Bullet.instance()
		bullet.position = position + Vector2(0,-5).rotated(rotation)
		bullet.rotation = rotation
		bullet.velocity.x = -5
		Bullets.add_child(bullet)
		bullet = Bullet.instance()
	if Input.is_action_just_pressed("shoot2"):
		var bullet2 = Bullet2.instance()
		bullet2.position = position + Vector2(0,-5).rotated(rotation)
		bullet2.rotation = rotation
		Bullets.add_child(bullet2)
	
	if Input.is_action_just_pressed("shoot3"):
		var bullet3 = Bullet3.instance()
		bullet3.position = position + Vector2(0,-5).rotated(rotation)
		bullet3.rotation = rotation
		Bullets.add_child(bullet3)
	
	if Input.is_action_pressed("ult"):
		var bullet4 = Bullet4.instance()
		bullet4.position = position + Vector2(0,-5).rotated(rotation)
		bullet4.rotation = rotation
		Bullets.add_child(bullet4)
	
	return toReturn.rotated(rotation)

func die():
	Global.change_lives(1)
	queue_free()
