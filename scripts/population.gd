extends Node

var board = load('res://scripts/board.gd')

var population = []

var globals_ref = null

func _init(gref):
	globals_ref = gref
	

# Called when the node enters the scene tree for the first time.
func setup():
	for i in range(globals_ref.POPULATION_LENGTH):
		var b = board.new(globals_ref)
		b.generate_genes()
		population.append(b)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
