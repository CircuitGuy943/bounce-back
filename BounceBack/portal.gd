extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$PortalAnimation.play()


func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://game_over.tscn")
#		await get_tree().create_timer(2000).timeout
#		get_tree().change_scene_to_file("res://Map.tscn")
