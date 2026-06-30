extends Control

@onready var Settings = $"."
@onready var StartBG = $"../TextureRect"
@onready var volume_slider = $BG/MarginContainer/VBoxContainer/Volume
@onready var difficulty_btn = $BG/MarginContainer/VBoxContainer/Difficulty
@onready var BG_btn = $BG/MarginContainer/VBoxContainer/Backgrounds

#Background pics
var bg_paths: Array = [
	"res://Assets/Art/BG/backgrounds-freebie/ruins version  (1)/ruins version  (1) pixelation 2/ruins version  (1) variant 05.png",
	"res://Assets/Art/BG/backgrounds-freebie/plains version (1)/plains version (1) pixelation 2/plains version (1) variant 05.png",
	"res://Assets/Art/BG/backgrounds-freebie/mountains version (1)/mountains version (1) pixelation 2/mountains version (1) variant 08.png",
	"res://Assets/Art/BG/backgrounds-freebie/canyon version (1)/canyon version (1) pixelation 2/canyon version (1) variant 05.png",
]


#loads game settings save visuals to match
func _ready() -> void:
	sync_ui_to_settings()

func sync_ui_to_settings() -> void:
	volume_slider.value = Savemanager.settings["master_volume"]
	difficulty_btn.selected = Savemanager.settings["ai_difficulty"]
	BG_btn.selected = Savemanager.settings["background"]
	set_background(Savemanager.settings["background"])
	
func master_volume(value)-> void:
	Savemanager.settings["master_volume"] = value
	AudioServer.set_bus_volume_db(0, linear_to_db(Savemanager.settings["master_volume"]))
	Savemanager.save_settings()

func ai_difficulty(value)-> void:
	Savemanager.settings["ai_difficulty"] = value
	Savemanager.save_settings()
	
func background_selection(index)-> void:
	Savemanager.settings["background"] = index
	Savemanager.save_settings()
	set_background(index)
	
func set_background(index)-> void:
	if index < 0 or index >= bg_paths.size():
		print("Error: Background index out of bounds!")
		return
	var chosen_path = bg_paths[index]
	StartBG.texture = load(chosen_path)

func _on_save_b_pressed() -> void:
	Savemanager.save_settings()

func _on_load_b_pressed() -> void:
	Savemanager.load_settings()

func _on_quit_b_pressed() -> void:
	get_tree().quit()

func _on_close_pressed() -> void:
	Settings.visible = false
