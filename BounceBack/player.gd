extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@export var gravity = 500

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var cooldown = 0

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("left"):
		velocity.x = velocity.x - speed
	if Input.is_action_pressed("right"):
		velocity.x = velocity.x + speed
	if Input.is_action_pressed("jump") and cooldown == 0:
		cooldown = 60

	if cooldown != 0:
		cooldown = cooldown - 1
		velocity.y -= cooldown * 15 # Use velocity.z or adjust axes for 3D if needed

	position += velocity * delta
	move_and_slide()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta # Use velocity.z or adjust axes for 3D if needed
	# Move the character
	move_and_slide()
	
	
