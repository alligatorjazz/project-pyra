extends Node2D
@export var speed: int;
var velocity = Vector2.ZERO;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with funcdtion body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_pressed = false;
	# player movement
	if Input.is_action_pressed("move_up"):
		velocity.y -= speed;
		move_pressed = true;
	if Input.is_action_pressed("move_down"):
		velocity.y += speed;
		move_pressed = true;
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed;
		move_pressed = true;
	if Input.is_action_pressed("move_right"):
		velocity.x += speed;
		move_pressed = true;

	position += velocity;


	# animation handling
	if velocity.x > 0:
		$Sprite.animation = "move_right";
	if velocity.x < 0:
		$Sprite.animation = "move_left";
	if velocity.y > 0:
		$Sprite.animation = "move_down";
	if velocity.y < 0:
		$Sprite.animation = "move_up";

	if velocity.length() == 0:
		$Sprite.pause();
	else:
		$Sprite.play();

	velocity = Vector2.ZERO;
