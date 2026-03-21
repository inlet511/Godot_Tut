class_name SlashManifest
extends AbilityManifest

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite.animation_finished.connect(_on_animation_finished)

func _activate(entity:Entity):
	var mouse_pos = get_viewport().get_camera_2d().get_global_mouse_position()
	look_at(mouse_pos)

func _on_animation_finished() -> void:
	queue_free()
