extends Sprite2D

@onready var houses: Array[Vector2] = [
	Vector2(-180, 32),Vector2(-115, 32),Vector2(-40, 32),Vector2(35, 32),Vector2(110, 32),Vector2(185, 32)]


func _ready():
	for pos in range(0, houses.size()):
		var house:House = preload("res://delivery/house.tscn").instantiate()
		var rng = RandomNumberGenerator.new()
		house.houseID = rng.randi_range(1, 2)
		house.global_position = houses[pos]
		add_child(house)

