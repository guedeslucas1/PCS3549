extends Node

var screen_width = 1024
var screen_height = 600

var initial_scene = load("res://Src/Teka Inicial/initial_scene.tscn")
var main_scene = load("res://Src/Main/Main.tscn")
var enemy_scene = load("res://Src/Inimigo/Inimigo.tscn")
var player_scene = load("res://Src/Player/Player.tscn")

var player

func mob_timer_timeout():
	if player.dead == true:
		return
		
	var enemy = enemy_scene.instance()
	
	var enemy_right = randf() > 0.5
	
	var enemy_pos = Vector2(0, screen_height/2)
	if enemy_right:
		enemy.velocity *= -1
		enemy_pos = Vector2(screen_width, screen_height/2)
	
	enemy.position = enemy_pos
	
	
	player.connect("swordAreaOn" , enemy, "sword_on")
	player.connect("swordAreaOff", enemy, "sword_off")
	add_child(enemy)

# Called when the node enters the scene tree for the first time.
func _ready():
	player = player_scene.instance()
	add_child(player)
	player.position = Vector2(screen_width/2, screen_height/2)
	$MobTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
