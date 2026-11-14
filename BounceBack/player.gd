extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@export var gravity = 500

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var cooldown = 0
var movement_script = 0

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("left"):
		velocity.x = velocity.x - speed
	if Input.is_action_pressed("right"):
		velocity.x = velocity.x + speed
	if Input.is_action_pressed("jump") and cooldown == 0:
		cooldown = 60
		
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	if velocity.x < 0:
		$AnimatedSprite2D.animation = "default"
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.animation = "default"
		$AnimatedSprite2D.flip_h = false
	if movement_script == 0:
		if cooldown != 0:
			cooldown = cooldown - 1
			velocity.y -= cooldown * 15 # Use velocity.z or adjust axes for 3D if needed

	position += velocity * delta
	move_and_slide()
	
var can_jump = true
func _physics_process(delta: float) -> void:
	if movement_script == 0:
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta # Use velocity.z or adjust axes for 3D if needed
		# Move the character
		move_and_slide()
	if movement_script == 1:
		if not is_on_floor():
			velocity.y += gravity * delta
		else:
			velocity.x = 0
			can_jump = true

		if Input.is_action_just_pressed("jump") and can_jump == true:
			if not is_on_floor():
				can_jump = false
			velocity.y = -sqrt(gravity * 4 * 200)

		move_and_slide()
	
func _on_area_2d_area_entered(area) -> void:
	if area.is_in_group("Bounce"):
		if movement_script == 0:
			cooldown = 60
		if movement_script == 1:
			velocity.y = -sqrt(gravity * 4 * 200)
