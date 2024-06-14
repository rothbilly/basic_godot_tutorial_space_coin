extends Node2D

@onready var monedas = $Monedas

var coins_count = 0


func _ready():
	get_coins_count()

func _on_player_grab_coin(value):
	coins_count -= 1
	print(coins_count)
	if coins_count <= 0:
		finish_level()
	
func get_coins_count():
	for child in monedas.get_children():
		if child.is_in_group("Coin"):
			coins_count += 1

func finish_level():
	get_tree().reload_current_scene()


func _on_monedas_add_coin():
	coins_count + 1
	print(coins_count)
