extends Area2D

@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"
@onready var area_2d: Area2D = $"."
var id

func _ready():
	id = get_meta("powerup_id")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		area_2d.visible = false
		match id:
			1:
				print("Double Jump")
				global.maxJumps = 2
				global.canDoubleJump = true
				await get_tree().create_timer(5.0).timeout
				print("Double jump over")
				global.maxJumps = 1
				global.canDoubleJump = false
				queue_free()
			2:
				print("Door")
			3:
				print("Weapon")
		
