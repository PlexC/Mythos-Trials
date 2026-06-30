extends Control

@onready var Settings = $Settings
var http_request = HTTPRequest.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect the HTTP node to a function so we can hear Reddit's reply
	http_request.request_completed.connect(_on_request_completed)

func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if response_code == 200:
		var json = JSON.parse_string(body.get_string_from_utf8())
		print("Reddit replied: ", json["message"])
	else:
		print("Failed to reach Devvit server. Error code: ", response_code)





func _on_play_pressed() -> void:
	print("Pinging Reddit...")
	var url = "/api/ping"
	http_request.request(url)


func _on_continue_pressed() -> void:
	pass # Replace with function body.


func _on_create_pressed() -> void:
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	Settings.visible = true
