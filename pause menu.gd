extends MenuButton


# Called when the node enters the scene tree for the first time.
func _ready():
    get_popup().id_pressed.connect(_on_menu_option_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func _on_menu_option_pressed(id : int) -> void:
    if id == 0:
        get_tree().quit()


func _on_toggled(toggled_on):
    get_tree().paused = toggled_on
