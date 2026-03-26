class_name Enemy
extends Entity

var player: Player
var velocity : Vector2
var current_speed: float
var distance: float

@export var max_speed: float
@export var stop_distance: float = 5
@onready var ability_controller: AbilityController = $AbilityController



func _ready():
	super._ready()
	player = get_tree().get_first_node_in_group("Player")
	print(player.name)

func _process(delta:float):	
	_handle_movement(delta)	
	_handle_face()
	_handle_animation()

func _handle_movement(delta:float):
	if player == null: return
	distance = (global_position - player.global_position).length()
	var dir = (player.global_position - global_position).normalized()
	if distance > stop_distance:
		position += dir * delta * max_speed
	else:
		ability_controller.trigger_ability_by_idx(0)

func _handle_animation():
	if distance <= stop_distance:
		play_animation(AnimationWrapper.new("idle",false))
	else:
		play_animation(AnimationWrapper.new("walk",false))


func _handle_face():
	var rel_x = player.global_position.x - global_position.x
	if rel_x > 0:
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true
