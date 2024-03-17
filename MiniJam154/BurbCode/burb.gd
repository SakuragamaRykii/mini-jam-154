extends CharacterBody2D
class_name Burb

enum CARRYING {NONE, CAT, FOOD}
enum CATCARRIED {NONE, RED, BLUE, GREEN}
var currentlyCarrying = CARRYING.NONE
var currentCat = CATCARRIED.NONE



@onready var anim = $AnimationTree
@onready var targetposition #= $destination
func _physics_process(delta):
	MovementAnim()
	pass

func _process(delta):
	match currentlyCarrying:
		0:
			$holding.text = "nothing."
		1:
			match currentCat:
				1:
					$holding.text = "Holding Red Cat"
				2: 
					$holding.text = "Holding Blue Cat"
				3:
					$holding.text = "Holding Green Cat"
		2:
			$holding.text = "Holding Cat Food"
func MovementAnim():
	if(velocity.length() > 0):
		$Idle.flip_h = velocity.x < 0
#	anim["parameters/Fly/blend_position"]
	
	if position.x >= 500:
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

