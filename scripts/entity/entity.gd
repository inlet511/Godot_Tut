class_name Entity
extends Node2D

var current_anim: AnimationWrapper
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite.animation_finished.connect(func(): current_anim = null)

func _process(delta: float) -> void:
	pass

func play_animation(anim:AnimationWrapper):
	if animated_sprite.animation == anim.name: return
	if (
		current_anim != null and current_anim.is_high_priority 
		and not anim.is_high_priority
		):return
	
	current_anim = anim	
	animated_sprite.play(anim.name)
