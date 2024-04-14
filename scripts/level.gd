class_name Level
extends Node2D

const PORTAL: PackedScene = preload("res://scenes/entities/portal.tscn")

@export var level_id: int

var level_data: LevelData


# Called when the node enters the scene tree for the first time.
func _ready():
	level_data = LevelManager.get_level_data_by_id(level_id)


func _physics_process(_delta):
	if Input.is_action_just_pressed("summon_portal"):
		var portal: Node  = PORTAL.instantiate()
		add_child(portal)
		portal.add_to_group("portals")
		portal.global_position = get_global_mouse_position()
		portal.world_switch.connect($TileMap.switch_world)