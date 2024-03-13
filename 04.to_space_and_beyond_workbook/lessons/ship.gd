extends Sprite2D

var velocity := Vector2(480, -480)


func _ready():
	pass # Replace with function body.



func _process(delta: float) -> void:
	position += velocity * delta
	rotation = velocity.angle()
