extends Node2D

const PORTAL: PackedScene = preload("res://scenes/entities/portal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("summon_portal"):
		var portal: Node  = PORTAL.instantiate()
		add_child(portal)
		portal.add_to_group("portals")
		portal.global_position = get_global_mouse_position()
		
