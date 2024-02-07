extends Node2D
var speed: float;
var direction: Vector2;

# Called when the node enters the scene tree for the first time.
var tween: Tween;
func animate():
	if tween:
		tween.kill();
	tween = create_tween();
	tween.set_loops(1);
	tween.tween_property($Sprite, "modulate:a", 1, 0.1);
	$Sprite.play();

func dissolve():
	$Sprite.modulate.a = 1;
	if tween:
		tween.kill();
	tween = create_tween();
	tween.set_loops(1);
	tween.tween_property($Sprite, "modulate:a", 0, 0.1);
	tween.tween_callback(queue_free);

func _ready():
	$Sprite.modulate.a = 0;
	rotation = direction.angle() + 3.14;
	animate();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction.normalized() * speed * delta;

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("fireball exited");
	dissolve();
