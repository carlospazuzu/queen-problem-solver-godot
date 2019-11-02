extends Node2D

var queen = load('res://game_objects/queen/Queen.tscn')

onready var globals_ref = $'/root/Globals'

var queens = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(globals_ref.size):
		var q = queen.instance()
		q.position = Vector2(-100, 0)
		queens.append(q)

	for i in range(globals_ref.size):
		get_tree().root.get_node('/root/Main/QueenPlacer/').add_child(queens[i])
		

func place_queens(board):
	for i in globals_ref.size:
		var current_position = board._find_queen_vector2D(i)
		queens[i].position = Vector2(current_position.y * (OS.window_size.x / (globals_ref.size + 2)) + ((OS.window_size.x / (globals_ref.size + 2)) + queens[i].texture.get_width() * 0.25), current_position.x * (OS.window_size.x / (globals_ref.size + 2)) + (OS.window_size.x / (globals_ref.size + 2)) + queens[i].texture.get_height() * 0.25)
