extends Node2D


signal add_coin

@export var coin_scene: PackedScene
@export var coin_spawn_time: = 1


@onready var screen_size = get_viewport_rect().size
@onready var timer = $Timer



func _ready():
	timer.wait_time = coin_spawn_time
	timer.start()

func spawn_random_coin():
	randomize()
	
	var new_coin = coin_scene.instantiate()
	self.add_child(new_coin)
	new_coin.position.x = randf_range(0, screen_size.x)
	new_coin.position.y = randf_range(0, screen_size.y)


func _on_timer_timeout():
	spawn_random_coin()
	add_coin.emit()
	timer.wait_time = coin_spawn_time
	timer.start()
