extends StaticBody2D

signal world_switch

var _is_player_in_range = false

@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.play("blue_summon" if Global.current_world == 1 else "orange_summon")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not animated_sprite.animation == "blue_summon" and not animated_sprite.animation == "orange_summon":
		animated_sprite.play("blue" if Global.current_world == 1 else "orange")


func _physics_process(_delta):
	if _is_player_in_range and Input.is_action_just_pressed("switch_world"):
		emit_signal("world_switch")


func _on_animated_sprite_2d_animation_finished():
	animated_sprite.play("blue" if Global.current_world == 1 else "orange")


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		_is_player_in_range = true


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		_is_player_in_range = false
