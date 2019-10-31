extends Node

class_name Board

var fitness: float = 0.0
var board = null

var globals_ref = null


func _init(gref):
	globals_ref = gref


# Called when the node enters the scene tree for the first time.
func setup():
	board = []
	for i in range(globals_ref.SIZE):
		board.append([])
		for j in range(globals_ref.SIZE):
			board[i].append(0)


func _find_queen_position(column):
	for i in range(globals_ref.SIZE):
		if board[i][column] == 1:
			return i


func generate_genes():
	for i in range(globals_ref.SIZE):
		board[randi() % globals_ref.SIZE][i]


func crossover(partner):
	var child = Board.new(globals_ref)
	child.setup()
	
	for i in range(globals_ref.SIZE):
		var r = randi() % 2
		
		if r == 0:
			child.board[_find_queen_position(i)][i] = 1
		else:
			child.board[partner._find_queen_position(i)][i] = 1
	
	return child
	

func mutate():
	for i in range(globals_ref.SIZE):
		var r = randi() % 100
		
		if r == 1:
			board[_find_queen_position(i)][i] = 0
			board[randi() % globals_ref.SIZE][i] = 1
	
	
func _find_queen_vector2D(column):
	for i in range(globals_ref.SIZE):
		if board[i][column] == 1:
			var position = Vector2()
			position.x = column
			position.y = i
			
			return position
			
			
func calculate_fitness() -> float:
	var portion: float = 0.041666666666666664

	var score: float = 0.0
	
	for i in range(globals_ref.SIZE):
		var qpos = _find_queen_vector2D(i)
		
		var found_UL: bool = false
		
		if qpos.y > 0 and qpos.x > 0:
			var cxpos = qpos.x - 1
			var cypos = qpos.y - 1
			
			while cxpos > 0 and cypos > 0:
				if board[cypos][cxpos] == 1:
					found_UL = true
					break
				
				cxpos = cxpos - 1
				cypos = cypos - 1
			
		if not found_UL: score += portion
		
		var found_UR: bool = false
		
		if qpos.y > 0 and qpos.x <= globals_ref.SIZE - 1:
			var cxpos = qpos.x + 1
			var cypos = qpos.y - 1
			
			while cxpos <= globals_ref.SIZE - 1 and cypos >= 0:
				if board[cypos][cxpos] == 1:
					found_UR = true
					break
				
				cxpos = cxpos + 1
				cypos = cypos - 1
		
		if not found_UR: score += portion
		
		var found_LL: bool = false
		
		if qpos.y < globals_ref.SIZE - 1 and qpos.x > 0:
			var cxpos = qpos.x - 1
			var cypos = qpos.y + 1
			
			while cxpos >= 0 and cypos <= globals_ref.SIZE - 1:
				if board[cypos][cxpos] == 1:
					found_LL = true
					break
				
				cxpos = cxpos - 1
				cypos = cypos + 1
		
		if not found_LL: score += portion
		
		var found_LR: bool = false
		
		if qpos.y < globals_ref.SIZE - 1 and qpos.x < globals_ref.SIZE - 1:
			var cxpos = qpos.x + 1
			var cypos = qpos.y + 1
			
			while cxpos <= globals_ref.SIZE - 1 and cypos <= globals_ref.SIZE - 1:
				if board[cypos][cxpos] == 1:
					found_LR = true
					break
				
				cxpos = cxpos + 1
				cypos = cypos + 1
		
		if not found_LR: score += portion
		
		var found_L: bool = false
		
		if qpos.x > 0:
			var cxpos = qpos.x - 1
			
			while cxpos >= 0:
				if board[qpos.y][qpos.x] == 1:
					found_L = true
					break
					
				cxpos = cxpos - 1
				
		if not found_L: score += portion
				
		var found_R: bool = false
		
		if qpos.x < globals_ref.SIZE - 1:
			var cxpos = qpos.x + 1
			
			while cxpos <= globals_ref.SIZE - 1:
				if board[qpos.y][qpos.x] == 1:
					found_R = true
					break
					
				cxpos = cxpos + 1
				
		if not found_R: score += portion		
				
				
				
	fitness = score
	
	return score
			
		
		
		