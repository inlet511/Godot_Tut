class_name Ability
extends Node

func activate(entity: Entity):
	print("Activate ability: ", self.name)
	_activate_component(entity)

func _activate_component(entity: Entity):
	for child in get_children():
		if child is AbilityComponent:
			child.activate(entity)
