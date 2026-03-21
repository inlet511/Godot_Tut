class_name AbilityComponent

extends Node

func activate(entity:Entity):
	print("Activating Component: ", self.name)
	_activate(entity)

func _activate(entity:Entity):
	pass
