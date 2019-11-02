 extends Node2D

onready var globals_ref = get_node('/root/Globals')

var square: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	square = OS.window_size.x / (globals_ref.size + 2)
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _get_color(neg):
	if neg:
		return '#AF6329'
	else:
		return '#FDE5B9'


func _draw():
	var neg = false
	for i in range(globals_ref.size):
		for j in range(globals_ref.size):
			draw_rect(Rect2(Vector2(square * j + square, square * i + square), Vector2(square, square)), Color(_get_color(neg)), true)
			neg = not neg
		if globals_ref.size % 2 == 0:
			neg = not neg