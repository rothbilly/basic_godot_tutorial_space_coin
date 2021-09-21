extends KinematicBody2D

const VIEW_SCALE = 100

export var max_speed :float = 1000
export var acelearation :int = 200 

var direction: Vector2 = Vector2.ZERO
var velocity = Vector2.ZERO

onready var screen_size = get_viewport_rect().size

onready var shape = $CollisionShape2D.shape
onready var anim_node := $AnimationPlayer
	
func _physics_process(delta):
	get_input()
	
	if direction.length() >= 0:
		velocity = lerp(velocity, direction * acelearation * delta * VIEW_SCALE, 0.3)
	else:
		velocity = lerp(velocity, Vector2.ZERO , 0.1)

	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	velocity.y = clamp(velocity.y, -max_speed, max_speed)
	
	velocity = move_and_slide(velocity)
	
	position.x = wrapf(position.x, 0, screen_size.x + shape.height * 0.5)
	position.y = wrapf(position.y, 0, screen_size.y + shape.radius * 0.5)

func get_input():
	direction = Vector2.ZERO
	
	direction.x = Input.get_action_strength("ui_right")
	direction.x = direction.x - Input.get_action_strength("ui_left")
	
	direction.y = Input.get_action_strength("ui_down")
	direction.y = direction.y - Input.get_action_strength("ui_up")
	
	direction = direction.normalized()
	
	if direction.x > 0:
		anim_node.current_animation = "turn_right"
	elif direction.x < 0:
		anim_node.play("turn_left")
	else:
		anim_node.play("idle")
	
	print(direction.length())

