extends Area2D

@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"
@onready var area_2d: Area2D = $"."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var id

func _ready():
	id = get_meta("powerup_id")
	
	match id:
		1:
			animated_sprite_2d.animation = "double_jump"
		2:
			animated_sprite_2d.animation = "portal"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		queue_free()
		match id:
			1:
				global.canDoubleJump = 10.0
			2:
				global.portalActive = 10.0
			3:
				global.canJump = 10.0
		
