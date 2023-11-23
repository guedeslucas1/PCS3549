extends Area2D

signal hit

var atacking = false 
var looking_right = true

func atack():
	if not atacking:
		# TODO: usar signal da AniamtedSprite para ver se a animação ja acabou
		$AnimatedSprite.animation = "Atack"
		$AnimatedSprite.flip_h = (not looking_right);
		$AnimatedSprite.play()
		atacking = true;

func end_animation():
	$AnimatedSprite.stop()
	atacking = false;

func _ready():
	set_process(true)
	$CollisionShape2D.disabled = false

func _process(delta):
	if Input.is_action_pressed("atack"):
		atack()
		
	if Input.is_action_pressed("look_right"):
		looking_right = true
	elif Input.is_action_pressed("look_left"):
		looking_right = false


func _on_Player_body_entered(body):
	print("Player hit!")
	hide() # Player disappears after being hit.
	emit_signal("hit")
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)

