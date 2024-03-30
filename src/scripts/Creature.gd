extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area: Area2D):
	print("creature collision detected: ", area);
	#player detection
	if area.get_parent().name == "Player":
		if area.name == "flame":
			var direction = position.direction_to(area.get_parent().position);
			position += direction * area.light_level / 100;
			print("moving towards player")


func _on_area_2d_body_entered(body):
	print("creature collision detected: ", body);
	#player detection
	if body.get_parent().name == "Player":
		if body.name == "flame":
			var direction = position.direction_to(body.get_parent().position);
			position += direction * body.light_level / 100;
			print("moving towards player")


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("creature collision detected: ", area);
	#player detection
	if area.get_parent().name == "Player":
		if area.name == "flame":
			var direction = position.direction_to(area.get_parent().position);
			position += direction * area.light_level / 100;
			print("moving towards player")
