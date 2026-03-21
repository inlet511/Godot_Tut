class_name AbilitySpawnManifest
extends AbilityComponent

@export var manifest_scene: PackedScene
@export var set_as_child: bool = false
@export var spawn_offset: Vector2 = Vector2.ZERO

func _activate(entity:Entity):
	if manifest_scene == null: return
	var spawned_inst= manifest_scene.instantiate() as AbilityManifest
	if set_as_child:
		entity.add_child(spawned_inst)
	else:
		var root = get_tree().get_root()
		spawned_inst.position = entity.position
		root.add_child(spawned_inst)
	
	spawned_inst.position += spawn_offset
	spawned_inst.activate(entity)
