extends Node2D

# Credit / Reference Materials
# Keyboard Buttons: https://docs.godotengine.org/en/stable/classes/class_animatedsprite.html
# Animated Sprite Tutorial: https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html

onready var _animated_sprite = $AnimatedSprite
var _facingDirection = ""

# Note: Input handling is primitive to keep code minimal.
func _process(_delta):
	if _facingDirection == "" && Input.is_action_pressed("ui_left"):
		MoveInDirection("Left")
	elif _facingDirection == "" && Input.is_action_pressed("ui_right"):
		MoveInDirection("Right")

	if _facingDirection == "Left" && Input.is_action_just_released("ui_left"):
		StopMovement()
	elif _facingDirection == "Right" && Input.is_action_just_released("ui_right"):
		StopMovement()

func MoveInDirection(dir):
	_animated_sprite.play("run")
	_facingDirection = dir
	if dir == "Left":
		_animated_sprite.flip_h = true
	else:
		_animated_sprite.flip_h = false

func StopMovement():
	_animated_sprite.stop()
	_facingDirection = ""

# gc support functions below here
func Start():
	pass

func Stop():
	pass

func GetGodotDocUrl():
	return "tutorials/2d/2d_sprite_animation.html"
