extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("left"):
		velocity.x = velocity.x - 1 
	if Input.is_action_pressed("right"):
		velocity.x = velocity.x + 1
	if velocity.y == 0:
		velocity.y = 0.001
	else:
		velocity.y = velocity.y * 1.05

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

		
	position += velocity * delta

	move_and_slide()
