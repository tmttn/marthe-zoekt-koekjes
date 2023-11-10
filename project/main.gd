extends Node2D

signal gameOver

var worldScenes
var gameOverMenu
var worldIndex = -1
var gameFinished = false

func _ready():
	gameOverMenu = preload("res://game_over_menu.tscn")
	worldScenes = [
		preload("res://worlds/world_1.tscn"),
		preload("res://worlds/world_2.tscn"),
		preload("res://worlds/world_3.tscn"),
	]
	
	load_next_world()
	
func _on_world_finished():
	get_tree().get_first_node_in_group("worlds").queue_free()
	if worldIndex < worldScenes.size() - 1:
		load_next_world()
	else:
		var gameOverMenuInstance = gameOverMenu.instantiate()
		add_child(gameOverMenuInstance)
	
func load_next_world():
		worldIndex += 1
		var worldInstance = worldScenes[worldIndex].instantiate()
		worldInstance.connect("worldFinished", _on_world_finished)
		add_child(worldInstance)
