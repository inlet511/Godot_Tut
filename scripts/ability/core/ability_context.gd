class_name AbilityContext
extends RefCounted

var caster: Entity
var ability:Ability
var target: Variant = null

func _init(caster: Entity, ability: Ability):
	self.caster = caster
	self.ability = ability

func get_target_position()-> Vector2:
	if target is Enemy:
		return target.global_position
	elif target is Vector2:
		return target
	else:
		return Vector2.ZERO
