extends Sprite2D

enum cOlour{rEd, bLue, gReen}
var sTored_cOlour
@onready var aNime = $AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible == true:
		match sTored_cOlour:
			cOlour.rEd:
				aNime.play("Red_Idle")
			cOlour.bLue:
				aNime.play("Blue_Idle")
			cOlour.gReen:
				aNime.play("Green_Idle")
		
	
	pass
