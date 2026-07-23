extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

var currentLevel
		
func _ready() -> void:
	currentLevel = get_tree().current_scene.name
	print(currentLevel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	collision_shape_2d.disabled = !global.portalActive > 0.0
	
	if global.portalActive > 0.0:
		animated_sprite_2d.animation = "active"
	else:
		animated_sprite_2d.animation = "inactive"
		



func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "CharacterBody2D":
		animation_player.play("circle_close")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "circle_close":
		print("Animation finished!")
		match currentLevel:
			"Tutorial": 
				get_tree().change_scene_to_file("res://level_1.tscn")
				pass
			"Level1": 
				get_tree().change_scene_to_file("res://ending.tscn")
				pass
