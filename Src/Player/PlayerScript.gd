extends Area2D

signal swordAreaOn
signal swordAreaOff

export var dead = false

func atack():
	emit_signal("swordAreaOn")
	$AnimatedSprite.animation = "Atack"
	$AnimatedSprite.play()

func end_animation():
	emit_signal("swordAreaOff")
	$AnimatedSprite.stop()

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("atack"):
		atack()
		
	if Input.is_action_pressed("look_right"):
		scale = Vector2(1,1)
	elif Input.is_action_pressed("look_left"):
		scale = Vector2(-1,1)


func _on_Player_area_entered(area):
	print("Player hit!")
	hide() # Player disappears after being hit.
	dead = true


func _on_SwordArea_area_entered(area):
	pass # Replace with function body.
