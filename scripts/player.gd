extends CharacterBody2D


@export var speed: float = 300.0
@export var jump_vel: float = -250.0
@export var jump_time: float = 0.25
@export var coyote: float = 0.075
@export var grav_mul: float = 3.0

var _gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var _is_jumping: bool = false
var _jump_timer: float = 0
var _coyote_timer: float = 0

@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor() and not _is_jumping:
		velocity.y += _gravity * grav_mul * delta
		_coyote_timer += delta
	else:
		_coyote_timer = 0

	if Input.is_action_just_pressed("jump") and (is_on_floor() or _coyote_timer < coyote):
		velocity.y = jump_vel
		_is_jumping = true
	elif Input.is_action_pressed("jump") and _is_jumping:
		velocity.y = jump_vel

	if _is_jumping and Input.is_action_pressed("jump") and _jump_timer < jump_time:
		_jump_timer += delta
	else:
		_jump_timer = 0
		_is_jumping = false

	var dir = Input.get_axis("walk_left", "walk_right")
	velocity.x = dir * speed
	if dir < 0:
		_animated_sprite.flip_h = false
		_animated_sprite.play("walk")
	elif dir > 0:
		_animated_sprite.flip_h = true
		_animated_sprite.play("walk")
	else:
		_animated_sprite.play("idle")

	move_and_slide()
