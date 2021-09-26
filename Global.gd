extends Node

var level = 1.0
var score = 0
var lives = 5

func _ready():
	randomize()
	change_score(0)
	change_lives(0)
	
func _process(_delta):
	if Input.is_action_pressed("quit"):	
		get_tree().quit()
	level = clamp(level, 0, 6)


func change_score(s):
	score += s
	var Score = get_node_or_null("/root/Game/CanvasLayer/HUD/Score")
	if Score != null:
		Score.text = "Score: " + str(score)
		
func change_lives(l):
	lives -= l
	if lives <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var Lives = get_node_or_null("/root/Game/CanvasLayer/HUD/Lives")
	if Lives != null:
		Lives.text = "Lives: " + str(lives)
