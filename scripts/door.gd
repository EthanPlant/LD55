extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.current_world == 2:
		visible = false
		$Area2D.get_node("CollisionShape2D").disabled = true
	else:
		visible = true
		$Area2D.get_node("CollisionShape2D").disabled = false

func _on_area_2d_body_entered(body:Node2D):
	if body.name == "Player":
		print("Level complete!")
