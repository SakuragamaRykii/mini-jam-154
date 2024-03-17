extends Node2D
class_name House
var burb: Burb
enum WANT {NONE, RED, BLUE, GREEN}
var currentWant = WANT.NONE
var houseID = 1
@onready var house:Sprite2D = $HouseSprite
@onready var timer = %rngCD
@onready var patienceBar: ProgressBar = $patience
var patience = 0
var rng = RandomNumberGenerator.new()
var maxrng = 50
var minTime = 100

func _ready():
	ShowWant()
	patience = rng.randi_range(minTime, 120)
	patienceBar.max_value = patience
	timer.start(1)
	
func _on_timer_timeout():
	if(currentWant == WANT.NONE):
		var value = rng.randi_range(0, maxrng)
		if(value == 0):
			currentWant = rng.randi_range(1, 3)
			ShowWant()
			maxrng -= 1
			patienceBar.value = patience
	else:
		patience -= 1
		if(patience < 0):
			MainScene.UpdateRep(-5)
		patienceBar.value = patience
	
	

func ShowWant():
	
	match currentWant:
		WANT.NONE:
			if houseID == 1:
				house.texture = load("res://Assets/Houses/house1-default.png")
			else:
				house.texture = load("res://Assets/Houses/house2-default.png")
		WANT.RED:
			if houseID == 1:
				house.texture = load("res://Assets/Houses/house1-want-red.png")
			else:
				house.texture = load("res://Assets/Houses/house2-want-red.png")
		WANT.BLUE:
			if houseID == 1:
				house.texture = preload("res://Assets/Houses/house1-want-blue.png")		
			else:
				house.texture = preload("res://Assets/Houses/house2-want-blue.png")
		WANT.GREEN:
			if houseID == 1:
				house.texture = preload("res://Assets/Houses/house1-want-green.png")
			else:
				house.texture = preload("res://Assets/Houses/house2-want-green.png")
func _on_button_pressed():
	print("house")
	if(burb):
		if(burb.currentlyCarrying == burb.CARRYING.CAT):
			if(burb.currentCat == currentWant):
				print("YIPEE CAT")
				MainScene.AddScore()
				MainScene.UpdateRep(100)
				currentWant = WANT.NONE
				burb.currentlyCarrying = burb.CARRYING.NONE
				burb.currentCat = burb.CATCARRIED.NONE
				patience = rng.randi_range(10, 120)
				patienceBar.max_value = patience
				if(minTime > 10):
					minTime -= 2
				ShowWant()
		pass

	
	
	
	
	
func _on_area_2d_body_entered(body):
	print("HELLO HOUSE")
	burb = body
func _on_area_2d_body_exited(body):
	burb = null




