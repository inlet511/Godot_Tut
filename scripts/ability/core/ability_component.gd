class_name AbilityComponent

extends Node

func activate(context: AbilityContext):
	print("Activating Component: ", self.name)
	_activate(context)

func _activate(context: AbilityContext):
	pass
