extends Node

const  GAME_SIZE: Vector2 = Vector2(1250,720)
const CELL_SIZE = Vector2(32, 32)

var textbox: Textbox = null

func _ready() -> void:
	randomize()
