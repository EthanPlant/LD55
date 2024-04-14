extends StaticBody2D

@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.play("blue_summon" if Global.current_world == 1 else "orange_summon")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not animated_sprite.animation == "blue_summon" and not animated_sprite.animation == "orange_summon":
		animated_sprite.play("blue" if Global.current_world == 1 else "orange")


func _on_animated_sprite_2d_animation_finished():
	animated_sprite.play("blue" if Global.current_world == 1 else "orange")
