extends Area2D
class_name Coin

@export var value := 5

func on_destroy():
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	self.queue_free()


func _on_body_entered(body):
	if body is CharacterBody2D:
		if body.is_in_group("Player"):
			on_destroy()
