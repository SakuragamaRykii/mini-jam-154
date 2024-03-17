extends Sprite2D
class_name Box
enum COLOUR{RED, BLUE, GREEN}
var currentColour
@onready var anim = $AnimationPlayer
var fed = false
const maxHunger = 250
var currentHunger = 250
var hungerDecreaseTimer = 1
func _process(delta):
	if(fed):
		if(hungerDecreaseTimer > 0):
			hungerDecreaseTimer -= get_process_delta_time()
		else:
			hungerDecreaseTimer = 1
			currentHunger -= 10
			$hunger.value = currentHunger
			if(currentHunger <= 0):
				currentHunger = maxHunger
				ChangeColour()
				fed = false
				visible = false
				MainScene.KittenDies()
	

func ChangeColour():
	$hunger.visible = false
	match currentColour:
		COLOUR.RED:
			anim.play("Red_Idle")
		COLOUR.BLUE:
			anim.play("Blue_Idle")
		COLOUR.GREEN:
			anim.play("Green_Idle")
func Feed():
	fed = true
	$hunger.visible = true
	currentHunger = maxHunger
	match currentColour:
		COLOUR.RED:
			anim.play("Open_Red")
		COLOUR.BLUE:
			anim.play("Open_Blue")
		COLOUR.GREEN:
			anim.play("Open_Green")
	

