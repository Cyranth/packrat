extends Node

const RAT_SCAVENGE_SPEED: float = 220.0
const RAT_RETURN_SPEED: float = 200.0
const JUNK_DESPAWN_MIN: float = 35.0
const JUNK_DESPAWN_MAX: float = 50.0
const JUNK_MIN_FLOOR: int = 6
const SPAWN_WEIGHTS = {
	GameState.ResourceType.FLUFF: 5,
	GameState.ResourceType.SCRAP: 7,
	GameState.ResourceType.FOOD: 4,
	GameState.ResourceType.SHINY: 2,
}
