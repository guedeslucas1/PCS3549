extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Controls/RestartBtn.grab_focus()

func _on_RestartBtn_pressed():
	get_tree().change_scene("res://Src/Main/Main.tscn")

func _on_QuitBtn_pressed():
	get_tree().quit()
