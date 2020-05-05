extends Area2D

export(int) var SPEED = 70

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite

var running = false

func _process(delta):
	running = false
	
	if Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		move(Vector2(-SPEED, 0), delta)
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		move(Vector2(SPEED, 0), delta)
	if Input.is_action_pressed("ui_up"):
		move(Vector2(0, -SPEED), delta)
	if Input.is_action_pressed("ui_down"):
		move(Vector2(0, SPEED), delta)
		
	if running:
		animationPlayer.play("Run")
	else:
		animationPlayer.play("Idle")

func move(velocity, time):
	position += velocity * time
	running = true

