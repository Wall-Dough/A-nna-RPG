extends ItemList


# Called when the node enters the scene tree for the first time.
func _ready():
    add_item_to_inventory({"name": "Helmet", "type": "head", "equipped": true})
    add_item_to_inventory({"name": "Body Armor", "type": "torso", "equipped": true})
    add_item_to_inventory({"name": "Leggings", "type": "legs", "equipped": true})
    add_item_to_inventory({"name": "Boots", "type": "feet", "equipped": true})
    add_item_to_inventory({"name": "Helmet 2", "type": "head", "equipped": false})


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func add_item_to_inventory(item_info: Dictionary):
    add_item(item_info["name"])
    set_item_metadata(item_count - 1, item_info)
    if item_info["equipped"]:
        select(item_count - 1, false)

func _on_multi_selected(index, selected):
    var new_metadata = get_item_metadata(index)
    new_metadata["equipped"] = selected
    if !selected:
        return
    set_item_metadata(index, new_metadata)
    var selected_items = get_selected_items()
    for selected_idx in selected_items:
        if selected_idx != index:
            var old_metadata = get_item_metadata(selected_idx)
            if old_metadata["type"] == new_metadata["type"]:
                deselect(selected_idx)
                old_metadata["equipped"] = false
                set_item_metadata(selected_idx, old_metadata)


func _on_visibility_changed():
    if !hidden:
        get_tree().paused = true
        grab_focus()
        var down_event = InputEventAction.new()
        down_event.action = "ui_down"
        down_event.pressed = true
        Input.parse_input_event(down_event)
