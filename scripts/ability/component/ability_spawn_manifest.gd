class_name AbilitySpawnManifest
extends AbilityComponent

@export var manifest_scene: PackedScene
@export var set_as_child: bool = false
@export var spawn_offset: Vector2 = Vector2.ZERO

func _activate(context:AbilityContext):
	if manifest_scene == null: return
	var spawned_inst= manifest_scene.instantiate() as AbilityManifest
	if set_as_child:
		context.caster.add_child(spawned_inst)
	else:
		var root = get_tree().get_root()
		spawned_inst.position = context.caster.position
		root.add_child(spawned_inst)
	
	spawned_inst.position += spawn_offset
	spawned_inst.activate(context)
