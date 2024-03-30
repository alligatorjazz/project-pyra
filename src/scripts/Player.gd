extends CharacterBody2D
@export var speed: float = 250;
@export var fireball_speed: float = 1024;
@export var fireball_cost: float = 0.05;

var Fireball: PackedScene = preload("res://src/scenes/entities/Fireball.tscn");

func shoot_fireball(fireball_direction: Vector2):
	var fireball = Fireball.instantiate();
	fireball.speed = fireball_speed;
	fireball.direction = fireball_direction;
	fireball.position = position;
	$Flame.light_level -= fireball_cost;
	get_parent().add_child(fireball);

func _process_movement():
	# player movement
	if Input.is_action_pressed("move_up"):
		velocity.y -= speed;
		#move_pressed = true;
	if Input.is_action_pressed("move_down"):
		velocity.y += speed;
		#move_pressed = true;
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed;
		#move_pressed = true;
	if Input.is_action_pressed("move_right"):
		velocity.x += speed;
		#move_pressed = true;

	move_and_slide()

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


func _process_action(snuffed: bool):
	$Flame.snuffed = snuffed;
	if !snuffed && Input.is_action_just_pressed("fire"):
		var mouse = get_viewport().get_mouse_position();
		shoot_fireball(position.direction_to(mouse));


func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#var move_pressed = false;
	_process_movement()
	_process_action(Input.is_action_pressed("snuff"))
	# debug
	$Status.text = "%s | %s" % [
		str(round($Flame.light_level * 100)),
		str($Flame.texture.get_size() * $Flame.energy)
	];

#
#func _on_collider_body_entered(body: Node2D):
	#velocity = Vector2.ZERO

