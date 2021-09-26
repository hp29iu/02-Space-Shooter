extends Area2D

var velocity = Vector2(10,0)

func _physics_process(_delta):
	position += velocity.rotated(rotation)
	

func _on_Enemy_Bullet_body_entered(body):
	if body.has_method("die"):
		body.die()
	queue_free()
