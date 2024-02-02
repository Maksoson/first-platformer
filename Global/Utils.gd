extends Node


const SAVE_PATH = "res://savegame.bin"


func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"playerHP": Game.playerHP ,
		"playerGold": Game.playerGold,
	}

	if Game.playerHP <= 0:
		data = {
			"playerHP": Game.DEFAULT_PLAYER_HP ,
			"playerGold": Game.DEFAULT_PLAYER_GOLD,
		}

	file.store_line(JSON.stringify(data))


func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH):
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.playerHP = current_line["playerHP"]
				Game.playerGold = current_line["playerGold"]
