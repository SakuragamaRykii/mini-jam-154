extends Sprite2D

var burb: Burb
var hasFood = false
var foodProgress = 0
var makingFood = false
func _process(delta):
	if(makingFood):
		if(foodProgress < 1):
			foodProgress += get_process_delta_time()*2
		else:
			foodProgress = 0
			hasFood = true
			makingFood = false
			$CatfoodFull.visible = true		
	%LoadingBar.value = foodProgress
	
func _on_button_pressed():
	if(burb):
		if(!hasFood):
			makingFood = true
		else:
			if(burb.currentlyCarrying == burb.CARRYING.NONE):
				burb.currentlyCarrying = burb.CARRYING.FOOD
				$CatfoodFull.visible = false
				hasFood = false
	
	#MainScene.setSelectedAction(1)
	pass # Replace with function body.

func _on_area_2d_body_entered(body):
	print("foodFactory")
	burb = body
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	burb = null
	pass # Replace with function body.
