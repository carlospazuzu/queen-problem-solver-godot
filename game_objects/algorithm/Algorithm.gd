extends Node2D

var Board = load('res://scripts/board.gd')

# Called when the node enters the scene tree for the first time.
func _ready():
	var board = Board.new($'/root/Globals')
	board.setup()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
