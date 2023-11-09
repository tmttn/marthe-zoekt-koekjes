extends Node2D

func _on_cookie_controller_final_cookie_eaten():
	queue_free()
