class_name Ability
extends Node

func activate():
	print("Activate ability: ", self.name)
	_activate_component()

func _activate_component():
	for child in get_children():
		if child is AbilityComponent:
			child.activate()
