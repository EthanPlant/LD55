class_name Level
extends Node2D

const PORTAL: PackedScene = preload("res://scenes/entities/portal.tscn")

@export var level_id: int
@export var level_start: Node2D

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
		portal.world_switch.connect(_on_world_switch)


func _on_world_switch():
	$UI.get_node("WorldFade").get_node("AnimationPlayer").play("fade_blue" if Global.current_world == 1 else "fade_orange")
	$TileMap.switch_world()

func _on_player_player_died():
	# Remove all portals
	for portal in get_tree().get_nodes_in_group("portals"):
		portal.queue_free()
	
	if Global.current_world == 2:
		$TileMap.switch_world()