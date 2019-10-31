extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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
	for i in range(4):
		for j in range(4):
			draw_rect(Rect2(Vector2(110 * j + 110, 110 * i + 110), Vector2(110, 110)), Color(_get_color(neg)), true)
			neg = not neg
		neg = not neg