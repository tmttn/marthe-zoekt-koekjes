extends Node

signal finalCookieEaten

func _ready():
	for cookie in get_tree().get_nodes_in_group("cookies"):
		cookie.connect("hit",_on_cookie_hit)
	

func _on_cookie_hit():
	if get_tree().get_nodes_in_group("cookies").size() == 1:
		await get_tree().create_timer(2).timeout
		$AudioStreamPlayer.play()
		await get_tree().create_timer(2).timeout
		finalCookieEaten.emit()
