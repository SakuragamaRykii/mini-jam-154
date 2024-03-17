extends Area2D


func _on_body_entered(body):
	print("hi")
	get_tree().root.get_child(0).get_node("Camera").global_position.x = 240
	body.global_position.x = 435
	pass # Replace with function body.
