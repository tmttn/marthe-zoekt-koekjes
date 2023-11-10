extends Node2D

signal worldFinished

var initialPlayerPosition


# Called when the node enters the scene tree for the first time.
func _ready():
	initialPlayerPosition = $Player.position


func _on_cookie_controller_final_cookie_eaten():
	worldFinished.emit()


func _on_kill_zone_kill_zone_entered():
	$Player.position = initialPlayerPosition
