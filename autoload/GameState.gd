extends Node

enum ResourceType { FLUFF, SCRAP, FOOD, SHINY, TRAP_PARTS, POISON }

enum AtticTier { EAVES, STORAGE_ROOM, BALLROOM, GRAND_ATTIC, RATOPIA }

const RESOURCE_NAMES = {
	ResourceType.FLUFF: "Fluff",
	ResourceType.SCRAP: "Scrap",
	ResourceType.FOOD: "Food",
	ResourceType.SHINY: "Shiny",
	ResourceType.TRAP_PARTS: "Trap Parts",
	ResourceType.POISON: "Poison",
}

const RESOURCE_COLORS = {
	ResourceType.FLUFF: Color("#f0ead6"),
	ResourceType.SCRAP: Color("#f5f5dc"),
	ResourceType.FOOD: Color("#ffc0cb"),
	ResourceType.SHINY: Color("#add8e6"),
	ResourceType.TRAP_PARTS: Color("#a0a0a0"),
	ResourceType.POISON: Color("#98fb98"),
}

var current_attic: AtticTier = AtticTier.EAVES
var resources: Dictionary = {}
var resource_caps: Dictionary = {}

var rat_count: int = 1
var has_mate: bool = false

func _ready() -> void:
	for type in ResourceType.values():
		resources[type] = 0
		set_cap(type, _default_cap(type))

func _default_cap(type: ResourceType) -> int:
	match type:
		ResourceType.FLUFF: return 8
		ResourceType.SCRAP: return 6
		ResourceType.FOOD: return 5
		ResourceType.SHINY: return 3
		_: return 10

func get_resource(type: ResourceType) -> int:
	return resources.get(type, 0)

func get_cap(type: ResourceType) -> int:
	return resource_caps.get(type, 0)

func add_resource(type: ResourceType, amount: int) -> int:
	var current = resources[type]
	var cap = resource_caps[type]
	var added = min(amount, cap - current)
	resources[type] = current + added
	return added

func spend_resource(type: ResourceType, amount: int) -> bool:
	if resources[type] >= amount:
		resources[type] -= amount
		return true
	return false

func set_cap(type: ResourceType, cap: int) -> void:
	resource_caps[type] = cap

func has_resources(costs: Dictionary) -> bool:
	for type_str in costs:
		var type = int(type_str) as ResourceType
		if resources[type] < costs[type_str]:
			return false
	return true
