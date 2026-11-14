extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
@export var direction = 1

@onready var rayCastL = $RayCast2D
@onready var rayCastR = $RayCast2D2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rayCastR.is_colliding():
		var collider = rayCastR.get_collider()
		if not collider.is_in_group("Player"):
			direction = -1
			$Sprite2D.flip_h = false
	if rayCastL.is_colliding():
		var collider = rayCastL.get_collider()
		if not collider.is_in_group("Player"):
			direction = 1
			$Sprite2D.flip_h = true
		
	position.x += direction * speed * delta
