extends Control


func _on_player_grab_coin(value):
	$CenterContainer/Label.text = str(value)

