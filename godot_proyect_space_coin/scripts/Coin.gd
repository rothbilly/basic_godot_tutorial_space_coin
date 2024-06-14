extends Area2D
class_name coin

var point = 5
var player : Player

@onready var screen_size = get_viewport_rect().size

func _ready():
	randomise_pos()

func _process(delta):
	
	pass

func randomise_pos():
	randomize()
	self.position.x = randf_range(0, screen_size.x)
	self.position.y = randf_range(0, screen_size.y)

func _on_Coin_body_entered(body):
	print("enter")
	if body is Player:
		body.grab_point(point)
		self.queue_free()
	else:
		randomise_pos()

