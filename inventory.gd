extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func _on_visibility_changed():
    if visible:
        get_tree().paused = true
        $PanelContainer/MarginContainer/InventoryItemList.grab_focus()
        var down_event = InputEventAction.new()
        down_event.action = "ui_down"
        down_event.pressed = true
        Input.parse_input_event(down_event)
