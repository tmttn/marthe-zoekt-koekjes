extends Node2D

signal gameOver

var worldScenes
var worldIndex = -1
var gameFinished = false

func _ready():
	worldScenes = [
		preload("res://worlds/world_1.tscn"),
		preload("res://worlds/world_2.tscn"),
		preload("res://worlds/world_3.tscn")
	]

func _process(_delta):
	if get_tree().get_nodes_in_group("worlds").is_empty() and not gameFinished:
		load_next_world()
	
func load_next_world():
	if worldIndex < worldScenes.size() - 1:
		worldIndex += 1
		var worldInstance = worldScenes[worldIndex].instantiate()
		add_child(worldInstance)
	else:
		gameOver.emit()
		gameFinished = true
