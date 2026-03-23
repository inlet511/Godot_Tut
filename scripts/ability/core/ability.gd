class_name Ability
extends Node

@export var cooldown:float = 2.0

func activate(entity: Entity):
	var context = AbilityContext.new(entity, self)
	_activate_component(context)

func _activate_component(context: AbilityContext):
	for child in get_children():
		if child is AbilityComponent:
			child.activate(context)
