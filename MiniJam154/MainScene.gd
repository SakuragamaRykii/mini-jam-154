extends Sprite2D
@onready var player = %BURB
@onready var playerdest = %destination

func _ready():
	playerdest.position.x = player.position.x
	
func _physics_process(delta):
	if(Input.is_action_just_pressed("ClickLocation")):
		playerdest.global_position.x = get_global_mouse_position().x
		print(playerdest.global_position.x)
		var dir = Vector2(playerdest.global_position.x - player.position.x, 0).normalized().x
		player.velocity.x =  dir * 200
	player.move_and_slide()

func _on_destination_body_entered(body):
	body.velocity.x = 0
	pass # Replace with function body.
