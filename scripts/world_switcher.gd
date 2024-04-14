extends TileMap

const WORLD_1_LAYERS: Array[int]  = [0, 1, 2]
const WORLD_2_LAYERS: Array[int] = [3, 4, 5]

func _ready():
	for layer in WORLD_1_LAYERS:
		set_layer_enabled(layer, true)
	for layer in WORLD_2_LAYERS:
		set_layer_enabled(layer, false)


func switch_world():
	Global.current_world = 1 if Global.current_world == 2 else 2
	print("Switching to world ", Global.current_world)
	if Global.current_world == 1:
		for layer in WORLD_1_LAYERS:
			set_layer_enabled(layer, true)
		for layer in WORLD_2_LAYERS:
			set_layer_enabled(layer, false)
	else:
		for layer in WORLD_1_LAYERS:
			set_layer_enabled(layer, false)
		for layer in WORLD_2_LAYERS:
			set_layer_enabled(layer, true)