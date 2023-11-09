extends Node2D

var initialPlayerPosition

func _ready():
	initialPlayerPosition = $Player.position

func _on_cookie_controller_final_cookie_eaten():
	queue_free()


func _on_kill_zone_kill_zone_entered():
	$Player.position = initialPlayerPosition
