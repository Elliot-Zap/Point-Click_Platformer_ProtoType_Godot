extends KinematicBody2D

const MAX_SPEED = 400
const ACCELERATION  = 300
const FRICTION = 800
const MAX_JUMP = 300
const GRAVITY = 600 
onready var velocity = Vector2.ZERO
onready var jump_velocity = Vector2.ZERO
func _ready():
	pass

func _physics_process(delta):
	move_state(delta)
	
func move_state(delta):
	
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_select")
	
	if input_vector == Vector2.ZERO and is_on_floor():
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	else:
		if input_vector.x != 0:
			velocity.x = input_vector.x * MAX_SPEED* 30 * delta
		if input_vector.y < 0 and not is_on_floor():
			velocity.y += GRAVITY * delta * 2
		else:
			velocity.y += GRAVITY * delta	
		if Input.is_action_just_pressed("ui_select") and is_on_floor():
			velocity.y -= MAX_JUMP
	move()
	
func move():
	velocity = move_and_slide(velocity,Vector2.UP)
	
