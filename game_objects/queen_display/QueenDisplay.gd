extends Node2D

var title_queen = load('res://game_objects/title_queen/TitleQueen.tscn')
var title_queens = []

var current_board_size: int = 4

const MAX_BOARD_SIZE: int = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in MAX_BOARD_SIZE:
		var t = title_queen.instance()
		t.position = Vector2(-100, 0)
		add_child(t)
		title_queens.append(t)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	current_board_size = $"/root/Globals".size
	
	for i in range(MAX_BOARD_SIZE):
		title_queens[i].position = Vector2(-100, 0)
	
	match current_board_size:
		4:
			title_queens[0].position = Vector2(330 - title_queens[0].texture.get_width() * 0.25, 330 - title_queens[0].texture.get_height() * 0.25)
			title_queens[1].position = Vector2(330 + title_queens[1].texture.get_width() * 0.25, 330 - title_queens[1].texture.get_height() * 0.25)
			title_queens[2].position = Vector2(330 - title_queens[2].texture.get_width() * 0.25, 330 + title_queens[2].texture.get_height() * 0.25)
			title_queens[3].position = Vector2(330 + title_queens[3].texture.get_width() * 0.25, 330 + title_queens[3].texture.get_height() * 0.25)
		5:
			title_queens[0].position = Vector2(330, 330)
			title_queens[1].position = Vector2(330 - title_queens[0].texture.get_width() * 0.25, 330 - title_queens[0].texture.get_height() * 0.25)
			title_queens[2].position = Vector2(330 + title_queens[1].texture.get_width() * 0.25, 330 - title_queens[1].texture.get_height() * 0.25)
			title_queens[3].position = Vector2(330 - title_queens[2].texture.get_width() * 0.25, 330 + title_queens[2].texture.get_height() * 0.25)
			title_queens[4].position = Vector2(330 + title_queens[3].texture.get_width() * 0.25, 330 + title_queens[3].texture.get_height() * 0.25)
		6:
			title_queens[0].position = Vector2(220, 120)
			title_queens[1].position = Vector2(220, 290)
			title_queens[2].position = Vector2(220, 460)
			
			title_queens[3].position = Vector2(440, 120)
			title_queens[4].position = Vector2(440, 290)
			title_queens[5].position = Vector2(440, 460)
			
