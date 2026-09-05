extends Node

@onready var vmf_load_menu : Node
var loaded_vmf_path : String
var map_data : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	vmf_load_menu = FileDialog.new()
	vmf_load_menu.set_filename_filter(".vmf")
	vmf_load_menu.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	vmf_load_menu.use_native_dialog = true
	vmf_load_menu.name = "vmf_load_menu"
	vmf_load_menu.file_selected.connect(load_vmf_in_memory)
	add_child(vmf_load_menu, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func load_vmf_file() -> void:
	get_node("/root/global/vmf_load_menu").popup_file_dialog()

func load_vmf_in_memory(path : String) -> String:
	loaded_vmf_path = path
	map_data = FileAccess.get_file_as_string(loaded_vmf_path)
	print(map_data)
	return map_data
