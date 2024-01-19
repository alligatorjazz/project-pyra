extends Node2D
@export var speed: int;
@export var flicker_duration: float;
@export var flicker_intensity: float;

# The amount the flame decays per second.
@export var flame_decay: float;

var velocity = Vector2.ZERO;
var light_level: float = 1;

var _flicker_value: float = flicker_intensity;
var flicker_value: float:
	get:
		return _flicker_value;
	set(value):
		_flicker_value = value;

var flame_tween: Tween;
func animate_flame():
	if flame_tween:
		flame_tween.kill();
	flame_tween = create_tween();
	flame_tween.set_loops();
	flame_tween.set_ease(Tween.EASE_OUT);
	flame_tween.set_trans(Tween.TRANS_LINEAR);
	flame_tween.tween_property(self, "flicker_value", -flicker_intensity, flicker_duration / 2)
	flame_tween.chain().tween_property(self, "flicker_value", flicker_intensity, flicker_duration / 2);
	flame_tween.tween_callback(animate_flame).set_delay(0)
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

func _process_flame(delta: float):
	if Input.is_action_pressed("snuff"):
		$Flame.energy = 0;
		$Flame.texture_scale = 0;
	else:
		$Flame.energy = light_level + flicker_value;
		$Flame.texture_scale = light_level + flicker_value;
		light_level = clamp(light_level - (0.01 * delta), 0, 1);
func _ready():
	animate_flame();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var move_pressed = false;
	_process_movement()
	_process_flame(delta)

	# debug
	$Status.text = str(round(light_level * 100));
