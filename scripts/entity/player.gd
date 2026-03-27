class_name Player
extends Entity


@export var speed: float = 20
@onready var ability_controller: AbilityController = $AbilityController
@onready var weapon : Node2D = $Weapon

var is_moving = false
var weapon_right_pos:Vector2
var weapon_left_pos: Vector2
var weapon_right_angle: float
var weapon_left_angle: float

func _ready():
	add_to_group("Player")
	super._ready()
	weapon_right_pos = weapon.position
	weapon_left_pos = Vector2(-weapon_right_pos.x, weapon_right_pos.y)
	weapon_right_angle = weapon.rotation
	weapon_left_angle = -weapon.rotation

	
func _process(delta: float) -> void:	
	super._process(delta)
	_handle_movement(delta)
	_handle_animation()
	_handle_abilities()

func _handle_movement(delta: float):
	var horizontal = Input.get_axis("left", "right")
	var vertical = Input.get_axis("up", "down")
	var movement = Vector2(horizontal, vertical).normalized()
	
	self.position += movement * delta * speed
	
	if movement.length()>0:		
		if horizontal > 0:
			animated_sprite.flip_h = false
			weapon.position = weapon_right_pos
			#weapon.rotation = weapon_right_angle
		elif horizontal < 0:
			animated_sprite.flip_h = true
			weapon.position = weapon_left_pos
			#weapon.rotation = weapon_left_angle
		is_moving = true
	else:
		is_moving = false

func _handle_animation():
	if(is_moving):
		play_animation(AnimationWrapper.new("run"))
	else:
		play_animation(AnimationWrapper.new("idle"))

func _handle_abilities():
	if Input.is_action_just_pressed("ability_1"):
		ability_controller.trigger_ability_by_idx(0)
	if Input.is_action_just_pressed("ability_2"):
		ability_controller.trigger_ability_by_idx(1)
	if Input.is_action_just_pressed("ability_3"):
		ability_controller.trigger_ability_by_idx(2)

func show_damage_taken_fx():
	pass
