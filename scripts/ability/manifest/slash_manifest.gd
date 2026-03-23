class_name SlashManifest
extends AbilityManifest

@export var rotation_offset: float = 45.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite.animation_finished.connect(_on_animation_finished)

func _activate(context:AbilityContext):
	var mouse_pos = get_viewport().get_camera_2d().get_global_mouse_position()
	look_at(mouse_pos)
	var offset_rad = deg_to_rad(rotation_offset)
	var weapon = context.caster.get_node("Weapon") as Node2D
	var weapon_2_mouse = (mouse_pos - weapon.global_position).angle()
	var weapon_angle = weapon_2_mouse + offset_rad
	weapon.rotation = weapon_angle

func _on_animation_finished() -> void:
	queue_free()
