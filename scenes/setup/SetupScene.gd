extends Node2D

onready var globals_ref = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene('res://scenes/main/Main.tscn')
		
	if Input.is_action_just_pressed('ui_right'):
		globals_ref.size += 1
	if Input.is_action_just_pressed('ui_left'):
		globals_ref.size -= 1
		
	
	globals_ref.size = clamp(globals_ref.size, 4, 6)