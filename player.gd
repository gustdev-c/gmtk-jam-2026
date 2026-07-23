extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -550.0

var jumpsLeft = 1

func _physics_process(delta: float) -> void:

	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jumpsLeft = global.maxJumps
	
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			jumpsLeft = jumpsLeft - 1
		
		if not is_on_floor() and global.canDoubleJump > 0.0 and jumpsLeft > 0:
			velocity.y = JUMP_VELOCITY
			jumpsLeft = jumpsLeft - 1

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false

	move_and_slide()
