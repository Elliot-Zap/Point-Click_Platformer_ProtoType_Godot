extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var mouseHover = false
onready var velocity = Vector2.ZERO
const GRAVITY = 600 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_mouse_button_pressed(1) and mouseHover:
		global_position = get_global_mouse_position()
	else:
		if not is_on_floor():
			velocity.y += GRAVITY * delta*2
		else:
			velocity.y += GRAVITY * delta*2
		velocity = move_and_slide(velocity, Vector2.UP)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TouchBlock_mouse_entered():
	mouseHover=true


func _on_TouchBlock_mouse_exited():
	mouseHover = false
