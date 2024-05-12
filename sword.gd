extends Sprite2D

var start_rotation = 0
var target_rotation = 0
var rotation_delta = 10
var rotation_size = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	start_rotation = get_rotation_degrees()
	target_rotation = start_rotation


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if round(get_rotation_degrees()) != round(target_rotation):
		set_rotation(rotate_toward(deg_to_rad(get_rotation_degrees()),
			deg_to_rad(target_rotation), deg_to_rad(rotation_delta)))
	if round(get_rotation_degrees()) == round(target_rotation):
		target_rotation = start_rotation

func swing():
	print('swing')
	set_rotation_degrees(start_rotation)
	target_rotation = start_rotation + rotation_size
