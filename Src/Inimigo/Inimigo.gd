extends KinematicBody2D

export var velocity = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = "Walk"
	$AnimatedSprite.flip_h = (velocity.x < 0);
	$AnimatedSprite.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide(velocity)
