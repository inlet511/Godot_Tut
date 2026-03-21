extends Entity


@export var speed: float = 20
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ability_controller: AbilityController = $AbilityController
var is_moving = false


func _process(delta: float) -> void:	
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
		elif horizontal < 0:
			animated_sprite.flip_h = true
		is_moving = true
	else:
		is_moving = false

func _handle_animation():
	if(is_moving):
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")

func _handle_abilities():
	if Input.is_action_just_pressed("ability_1"):
		ability_controller.trigger_ability_by_idx(0)
	if Input.is_action_just_pressed("ability_2"):
		ability_controller.trigger_ability_by_idx(1)
	if Input.is_action_just_pressed("ability_3"):
		ability_controller.trigger_ability_by_idx(2)
	
