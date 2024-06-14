extends CharacterBody2D
class_name Player

const VIEW_SCALE = 100

@export var acelearation :int = 200 

var direction: Vector2 = Vector2.ZERO
var cust_rot_angle: = 0

@onready var screen_size = get_viewport_rect().size
@onready var shape = $CollisionShape2D.shape

@onready var tween: Tween = self.create_tween() 

func _physics_process(delta):
	get_input()
	
	velocity = direction * acelearation * delta * VIEW_SCALE
	set_velocity(velocity)
	move_and_slide()
	
	position.x = wrapf(position.x, 0, screen_size.x + shape.height * 0.5)
	position.y = wrapf(position.y, 0, screen_size.y + shape.radius * 0.5)
	rotation = lerp_angle(rotation, cust_rot_angle, 10 * delta)

func get_input():
	direction = Vector2.ZERO
	
	direction.x = Input.get_action_strength("ui_right")
	direction.x = direction.x - Input.get_action_strength("ui_left")
	
	if direction.x > 0:
		cust_rot_angle = 20
	elif direction.x < 0:
		cust_rot_angle = -20
	else:
		cust_rot_angle = 0

	direction.y = Input.get_action_strength("ui_down")
	direction.y = direction.y - Input.get_action_strength("ui_up")
	
	direction = direction.normalized()
	
signal coin_grabed
func grab_point(_points):
	emit_signal("coin_grabed", _points)
