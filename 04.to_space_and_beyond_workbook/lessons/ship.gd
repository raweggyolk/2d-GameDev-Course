extends Sprite2D

var velocity := Vector2(480, -480)
var max_speed := normal_speed
var boost_speed := 4000.0
var normal_speed := 2000.0
var steering_factor := 10.0

func _ready():
	pass # Replace with function body.


func _process(delta: float) -> void:
	var direction := Vector2(0, 0)
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	if direction.length() > 1.0:
		direction = direction.normalized()
	
	if Input.is_action_just_pressed("boost"):
		max_speed = boost_speed
		get_node("Timer").start()
		
	var desired_velocity := max_speed * direction
	var steering_vector := desired_velocity - velocity
	velocity += steering_vector * steering_factor * delta
	position += velocity * delta
	
	if direction.length() > 0.0:
		rotation = velocity.angle()


func _on_timer_timeout() -> void:
	max_speed = normal_speed
