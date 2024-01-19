extends Node2D
@export var speed = 8;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_pressed = false;
	if Input.is_action_pressed("move_up"):
		position.y -= speed;
		move_pressed = true;
	if Input.is_action_pressed("move_down"):
		position.y += speed;
		move_pressed = true;
	if Input.is_action_pressed("move_left"):
		position.x -= speed;
		move_pressed = true;
	if Input.is_action_pressed("move_right"):
		position.x += speed;
		move_pressed = true;

