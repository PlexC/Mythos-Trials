extends Node
# its local cus user (saved into godot app_userdata foulder)
const SETTINGS_FILE = "user://settings.dat"
const GAME_FILE = "user://savegame.dat"

#saves
var settings = {
	"master_volume": 1.0,
	"background": 0 #Mountains as default
}

var game_state = {
	"player_position": Vector2(0,0), #temp
	"keys": 0		#temp
}


func _ready() -> void:
	load_settings()

func save_settings() -> void:
	var file = FileAccess.open(SETTINGS_FILE, FileAccess.WRITE)
	file.store_var(settings)
	file.close()

func load_settings() -> void:
	if FileAccess.file_exists(SETTINGS_FILE):
		var file = FileAccess.open(SETTINGS_FILE, FileAccess.READ)
		settings = file.get_var()
		file.close()

#temp add more stuff later
func save_game(player_pos: Vector2, keys: int) -> void:
	game_state["player_position"] = player_pos
	game_state["keys"] = keys
	
	var file = FileAccess.open(GAME_FILE, FileAccess.WRITE)
	file.store_var(game_state)
	file.close()
