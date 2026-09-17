extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -550.0
var last
var jump
var yes = false


func _physics_process(delta: float) -> void:
	jump= false
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		if GlobalScript.check == true:
			velocity.y = JUMP_VELOCITY
			jump = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if GlobalScript.check == true:
		if direction:
			if jump:
				velocity.x = direction * 300
			else:
				velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		direction = 0
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	update_animation(direction)
	
func update_animation(direction):
	if direction > 0:
		$AnimationPlayer.play("right")
		last = 1
	elif direction < 0:
		$AnimationPlayer.play("left")
		last = 0
	else :
		if last == 0:
			$AnimationPlayer.play("idle_left")
		else:
			$AnimationPlayer.play("idle_right")
