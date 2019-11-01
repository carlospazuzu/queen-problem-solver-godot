extends Node2D

var Population = load('res://scripts/population.gd')
var population = null

var count: int = 0
var icount: int = 25

var found_solution: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	population = Population.new($"/root/Globals")
	population.setup()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	count += 1
	icount += 1
	
	if not found_solution:
		population.build_next_generation()
		
		var cf = population.get_current_fittest()
		
		if icount >= 25:
			get_node("/root/Main/QueenPlacer/").place_queens(cf)
			icount = 0
		
		if population.get_current_fittest_fitness() > 0.95:
			found_solution = true
	
	print('Generation ', count, ' MAX FITNESS = ', population.get_current_fittest_fitness())
	
	if found_solution:
		print('ACHEI!!!!!!!!!!!!!!!')
		set_process(false)
