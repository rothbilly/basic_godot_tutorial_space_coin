extends CharacterBody2D

signal grab_coin(value)


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direction := Vector2.ZERO #(0,0) 
var custom_rot:= 0

var score:= 0

@export var shape: CollisionShape2D
@export var aceleracion: float = 10.0

@export_category("player stats")
@export var hp: int = 5


@onready var screen_size = get_viewport_rect().size


func _physics_process(delta): #Physics Update
	get_input()
	
	velocity = direction * aceleracion 
	move_and_slide()
	
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
	rotation = lerp_angle(rotation, custom_rot, 10 * delta)
	
	
func get_input():
	direction = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	if direction.x > 0:
		custom_rot = -5
	elif direction.x < 0:
		custom_rot = 5
	else:
		custom_rot = 0
	
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	direction = direction.normalized()



func _on_capture_area_area_entered(area):
	if area:
		if area.is_in_group("Coin"):
			score += area.value
			grab_coin.emit(score)
