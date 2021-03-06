extends Area2D

export(int) var SPEED = 60

onready var sprite = $Sprite

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		sprite.set_frame(0)
		sprite.flip_h = true
		sprite.flip_v = false
		move(Vector2(-SPEED, 0), delta)
	if Input.is_action_pressed("ui_right"):
		sprite.set_frame(0)
		sprite.flip_h = false
		sprite.flip_v = false
		move(Vector2(SPEED, 0), delta)
	if Input.is_action_pressed("ui_up"):
		sprite.set_frame(1)
		sprite.flip_h = false
		sprite.flip_v = false
		move(Vector2(0, -SPEED), delta)
	if Input.is_action_pressed("ui_down"):
		sprite.set_frame(1)
		sprite.flip_h = true
		sprite.flip_v = true
		move(Vector2(0, SPEED), delta)


func move(velocity, time):
	position += velocity * time
