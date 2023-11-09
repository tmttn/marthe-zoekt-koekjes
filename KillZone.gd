extends Area2D

signal killZoneEntered

func _on_body_entered(body):
	killZoneEntered.emit()
