extends CharacterBody2D
class_name Burb
enum CARRYING {NONE, CAT, FOOD}
var currentlyCarrying = CARRYING.NONE
@onready var anim = $AnimationTree
@onready var targetposition #= $destination
func _physics_process(delta):
	MovementAnim()
	pass

func MovementAnim():
	if(velocity.length() > 0):
		$Idle.flip_h = velocity.x < 0
#	anim["parameters/Fly/blend_position"]
	
	if position.x >= 515:
		if currentlyCarrying == CARRYING.FOOD:
			currentlyCarrying = CARRYING.NONE
		anim["parameters/conditions/Flying"] = true
		anim["parameters/conditions/walking"] = false
		anim["parameters/Fly/blend_position"].x = currentlyCarrying
		position.y = 75
	else:
		anim["parameters/conditions/Flying"] = false
		anim["parameters/conditions/walking"] = true
		anim["parameters/Walk/blend_position"].x = int(velocity.length() > 0)
		anim["parameters/Walk/blend_position"].y = currentlyCarrying
		position.y = 115	

