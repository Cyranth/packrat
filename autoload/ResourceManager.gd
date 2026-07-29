extends Node

signal resource_changed(type: int, new_value: int, cap: int)
signal cap_changed(type: int, new_cap: int)

func add_resource(type: int, amount: int) -> int:
	var added = GameState.add_resource(type, amount)
	if added > 0:
		_emit_changed(type)
	return added

func spend_resource(type: int, amount: int) -> bool:
	var success = GameState.spend_resource(type, amount)
	if success:
		_emit_changed(type)
	return success

func set_cap(type: int, cap: int) -> void:
	GameState.set_cap(type, cap)
	_emit_changed(type)
	cap_changed.emit(type, cap)

func _emit_changed(type: int) -> void:
	var val = GameState.get_resource(type)
	var cap = GameState.get_cap(type)
	resource_changed.emit(type, val, cap)
