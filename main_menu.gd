extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect

func _on_button_pressed() -> void:
	color_rect.visible = true	
	animation_player.play("circle_close")


func _on_button_3_pressed() -> void:
	get_tree().quit()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "circle_close":
		get_tree().change_scene_to_file("res://tutorial.tscn")	
