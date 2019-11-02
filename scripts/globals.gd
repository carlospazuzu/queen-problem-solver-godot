extends Node

const POPULATION_LENGTH: int = 100

var size: int = 4


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func change_board_size(new_size):
	size = new_size
