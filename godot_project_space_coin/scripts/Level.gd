extends Node2D
class_name Level

@export var CoinScene: PackedScene ##Escena de las moneda
@export var max_coin: int  = 100

@onready var screen_size = get_viewport_rect().size

func _ready():
	for i in max_coin:
		instaciate_coin()
		pass
	pass 

func instaciate_coin():
	var coin = CoinScene.instantiate()
	add_child(coin)

var total_coin: int = 0

func _on_Player_coin_grabed(_point):
	total_coin += _point
	$CanvasLayer.update_gui(total_coin)
