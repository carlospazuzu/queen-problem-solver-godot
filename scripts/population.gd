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
		b.setup()
		b.generate_genes()
		population.append(b)
	

func build_mating_pool() -> Array:
	var mating_pool = []
	
	for p in population:
		p.calculate_fitness()
		
		for i in range(int(pow(p.fitness * 10, 2))):
			mating_pool.append(p)
			
	return mating_pool
	

func sort_board(a, b):
	if a.fitness > b.fitness:
		return true
	return false


func get_current_fittest():
	population.sort_custom(self, 'sort_board')
	
	return population[0]


func get_current_fittest_fitness():
	population.sort_custom(self, 'sort_board')
	
	return population[0].fitness
	
	
func build_next_generation():
	var mating_pool = build_mating_pool()
	var new_population = []
	
	for i in range(globals_ref.POPULATION_LENGTH):
		var child = mating_pool[randi() % len(mating_pool)].crossover(mating_pool[randi() % len(mating_pool)])
		child.mutate()
		child.calculate_fitness()
		new_population.append(child)
		

	population.clear()
	population = new_population
	 

