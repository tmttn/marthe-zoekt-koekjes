extends Node2D

func _ready():
	$AnimatedSprite2D.play("cheer")

func _on_button_pressed():
	get_tree().reload_current_scene()
