extends Area2D

# global variables
export var velocity = Vector2(500, 0)
export var score = 0

var player_sword_is_on = false
var inside_sword_area

func sword_on():
	player_sword_is_on = true

func sword_off():
	player_sword_is_on = false

func _ready():
	$AnimatedSprite.animation = "Walk"
	$AnimatedSprite.flip_h = (velocity.x < 0);
	$AnimatedSprite.play()
	$OrcSound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inside_sword_area and player_sword_is_on:
		queue_free()
		score += 1
	position += velocity*delta
	
	
func _on_Area2D_area_entered(area):
	if area.get_name() == "SwordArea":
		inside_sword_area = true
	#print(area)
