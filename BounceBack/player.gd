extends CharacterBody2D

<<<<<<< HEAD
=======
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@export var gravity = 500
>>>>>>> 57267a7dec544d52ba589a0ae4ded84a8bcbb90e

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


<<<<<<< HEAD
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
=======
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("left"):
		velocity.x = velocity.x - 1 
	if Input.is_action_pressed("right"):
		velocity.x = velocity.x + 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

		
	position += velocity * delta
>>>>>>> 57267a7dec544d52ba589a0ae4ded84a8bcbb90e

	move_and_slide()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta # Use velocity.z or adjust axes for 3D if needed

	# Move the character
	move_and_slide()
