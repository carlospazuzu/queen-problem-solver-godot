extends Node2D

export var color = '#333333'

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	update()


func change_color(new_color):
	color = new_color


func _draw():
	draw_rect(Rect2(Vector2(0, 0), Vector2(OS.window_size.x, OS.window_size.y)), Color(color), true)