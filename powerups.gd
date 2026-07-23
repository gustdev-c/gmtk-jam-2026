extends Area2D

@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"
@onready var area_2d: Area2D = $"."
var id

func _ready():
	id = get_meta("powerup_id")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		queue_free()
		match id:
			1:
				global.canDoubleJump = 10.0
				print("Double Jump")
			2:
				global.portalActive = 10.0
				print("Portal is now active")
		
