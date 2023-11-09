extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -550.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$JumpAudioStreamPlayer.play()
		

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Set the animation
	if velocity != Vector2.ZERO and is_on_floor():
		$AnimatedSprite2D.play("running")
	elif velocity == Vector2.ZERO and is_on_floor():
		$AnimatedSprite2D.play("idle")
	elif velocity != Vector2.ZERO and not is_on_floor():
		$AnimatedSprite2D.play("jumping")

	$AnimatedSprite2D.flip_h = velocity.x < 0

	move_and_slide()


func _on_cookie_hit():
	$EatCookieAudioStreamPlayer.play()
