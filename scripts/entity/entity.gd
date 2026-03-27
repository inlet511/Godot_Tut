class_name Entity
extends Node2D

@export var max_health:float = 50
var current_anim: AnimationWrapper
var current_health:float
var is_dead:bool = false
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite.animation_finished.connect(func(): current_anim = null)
	current_health = max_health
	
func apply_damage(damage:float):
	if is_dead: return
	
	current_health -= damage
	show_damage_taken_fx()
	current_health = max(0, current_health)
	if current_health==0:
		is_dead = true
	

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


func show_damage_taken_fx():pass
