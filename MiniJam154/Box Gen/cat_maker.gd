extends Sprite2D

var box_oPen: bool = false
const minTime = 3
const defaultTime = 30
var currentTime
@onready var timer = $Timer
@onready var box: Box = $Box

var burb: Burb
var inStock = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	box = $Box
	timer = $Timer
	currentTime = defaultTime
	timer.start(currentTime)
	Spawn()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!box.visible && inStock > 0):
		box.visible = true
		box.ChangeColour()
		inStock-=1
	
func Spawn():
	var rng = RandomNumberGenerator.new()
	var rngColour = rng.randi_range(0,2)
	box.currentColour = rngColour
	box.visible = true
	box.ChangeColour()

func _on_timer_timeout():
	#print("Banana(test debug)")
	if box.visible == false:
		Spawn()
	elif box.visible == true:
		inStock += 1
	pass # Replace with function body.


func _on_button_pressed():
	if(burb):
		if(burb.currentlyCarrying == 0):
			if(box.fed):
				burb.currentlyCarrying = 1
				match box.currentColour:
					0:
						burb.currentCat = 1
					1: 
						burb.currentCat = 2
					2:
						burb.currentCat = 3
				box.fed = false
				box.visible = false		
				currentTime -= 1
				if(currentTime < minTime):
					currentTime = minTime
		if(burb.currentlyCarrying == 2):
			box.Feed()
			burb.currentlyCarrying = 0


func _on_area_2d_body_entered(body):
	burb = body
func _on_area_2d_body_exited(body):
	burb = null

