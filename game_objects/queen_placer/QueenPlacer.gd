extends Node2D

var queen = load('res://game_objects/queen/Queen.tscn')

var queens = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range($'/root/Globals'.SIZE):
		var q = queen.instance()
		q.position = Vector2(-100, 0)
		queens.append(q)

	for i in range($'/root/Globals'.SIZE):
		get_tree().root.get_node('/root/Main/QueenPlacer/').add_child(queens[i])
		

func place_queens(board):
	for i in $"/root/Globals".SIZE:
		var current_position = board._find_queen_vector2D(i)
		queens[i].position = Vector2(current_position.y * 110 + 160, current_position.x * 110 + 160)
