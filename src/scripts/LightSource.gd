extends Node2D;
class_name LightSource;
@export_range(0.0, 1.0) var _light_level: float = 1.0;
const collision_radius = 110;
var light_level: float:
	get:
		return _light_level;
	set(value):
		_light_level = clamp(value, 0.0, 1.0);
		($Cone/Collision.shape as CircleShape2D).radius = round(value * collision_radius);
var texture: Texture:
	get:
		return $Light.texture;
	set(value):
		$Light.texture = value;
var energy: float:
	get:
		return $Light.energy;
	set(value):
		$Light.energy = value;

@export var snuffed = false;
@export var flicker_duration: float = 0.1;
@export var flicker_intensity: float = 0.01;
@export var light_decay: float = 0;

var _flicker_value: float = flicker_intensity;
var flicker_value: float:
	get:
		return _flicker_value;
	set(value):
		_flicker_value = value;

var flame_tween: Tween;
func animate_flame():
	duplicate()
	if flame_tween:
		flame_tween.kill();
	flame_tween = create_tween();
	flame_tween.set_loops();
	flame_tween.set_ease(Tween.EASE_OUT);
	flame_tween.set_trans(Tween.TRANS_LINEAR);
	flame_tween.tween_property(
		self,
		"flicker_value",
		-flicker_intensity,
		flicker_duration / 2
	);
	flame_tween.chain().tween_property(
		self,
		"flicker_value",
		flicker_intensity,
		flicker_duration / 2
	);
	flame_tween.tween_callback(animate_flame).set_delay(0)

func _process_light(delta: float):
	if snuffed:
		$Light.energy = 0;
		$Light.texture_scale = 0;
		($Cone/Collision.shape as CircleShape2D).radius = 0;
	else:
		$Light.energy = light_level + flicker_value;
		$Light.texture_scale = light_level + flicker_value;
		light_level -= (light_decay * delta);
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_process_light(delta)
