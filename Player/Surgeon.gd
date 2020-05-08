extends Area2D

export(int) var SPEED = 70

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite

func _process(delta):
	var direction = get_direction()
	update_animation(direction)
	move(direction, delta)

func get_direction():
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return direction

func move(direction, delta):
	position += direction * SPEED * delta

func update_animation(direction):
	if direction != Vector2.ZERO:
		if direction.x < 0:
			sprite.flip_h = true
		elif direction.x > 0:
			sprite.flip_h = false
		animationPlayer.play("Run")
	else:
		animationPlayer.play("Idle")

