extends Sprite2D
class_name MainScene
@onready var player:Burb = %BURB
@onready var playerdest = %destination
static var score = 0
static var reputation = 0
static var elapsedTime = 0
static var kittensDead = 0
static func KittenDies():
	kittensDead += 1
static func getElapsedTime():
	return elapsedTime
static func AddScore():
	score += (100 * (1+reputation/1000)) as int
static func UpdateRep(value):
	reputation += value

	


func _ready():
	playerdest.position.x = player.position.x
	
func _physics_process(delta):
	if(Input.is_action_just_pressed("ClickLocation")):
		playerdest.global_position.x = get_global_mouse_position().x
		#print(playerdest.global_position.x)
		var dir = Vector2(playerdest.global_position.x - player.position.x, 0).normalized().x
		if(abs(playerdest.global_position.x - player.position.x) < 20):
			player.velocity.x = 0
		else:
			player.velocity.x =  dir * 200
	player.move_and_slide()
	
func _process(delta):
	elapsedTime += get_process_delta_time()
	$CanvasLayer/ElapsedTime.text = "Time: %d min %d seconds" %[elapsedTime as int/60
	, elapsedTime as int %60 as int]
	$CanvasLayer/VBoxContainer/Score.text = "Score: %d" %score
	$CanvasLayer/VBoxContainer/Reputation.text = "Reputation: %d" %reputation
	CheckGO()

func CheckGO():
	if(kittensDead >= 5):
		GameOver("You didn't value the lives of kittens")
	elif(reputation < 0):
		GameOver("Cats couldn't get a kitten to hug and aged to death")
		
@onready var screenDarken = $CanvasLayer/GameOver
@onready var goText = $CanvasLayer/GameOver/Label

func GameOver(reason):
	screenDarken.visible = true
	goText.text = """Game Over.
	Reason: %s 
	Total Score : %d""" %[reason, score]
	set_physics_process(false)
	

func _on_destination_body_entered(body):
	body.velocity.x = 0



func _on_restart_pressed():
	get_tree().reload_current_scene()
	kittensDead = 0
	reputation = 0
	score = 0
	set_physics_process(true)



func _on_throw_pressed():
	if(player.currentlyCarrying == player.CARRYING.CAT):
		KittenDies()
	player.currentlyCarrying = player.CARRYING.NONE

