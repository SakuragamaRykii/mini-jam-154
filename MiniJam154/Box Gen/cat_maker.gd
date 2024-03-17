extends Sprite2D

var bOx_oPen: bool = false
const mIn_tImer = 3
const dEf_tImer = 2#30
@onready var tImer_tImer = $Timer
@onready var bOx = $Box



# Called when the node enters the scene tree for the first time.
func _ready():
	
	#tImer_tImer.time_left = dEf_tImer
	tImer_tImer.start(dEf_tImer)
	#while $Box != visible:
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	print("Banana(test debug)")
	
	
	if bOx.visible == false:
		var rNg_cOlor = RandomNumberGenerator.new()
		var hEld_cOlour = rNg_cOlor.randi_range(0,3)
		
		$Box.sTored_cOlour = hEld_cOlour
		
		bOx.visible = true
	elif bOx.visible == true:
		$Timer.stop()
	pass # Replace with function body.
