extends Area2D

@onready var canvas_group: CanvasGroup = $CanvasGroup
@onready var canvas_group_has_material: bool = canvas_group.material != null


func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	set_outline_thickness(5.0)
	canvas_group.material.set_shader_parameter("line_thickness", 5.0)


func set_outline_thickness(new_thickness: float) -> void:
	if canvas_group_has_material:
		canvas_group.material.set_shader_parameter("line_thickness", new_thickness)


func _on_mouse_entered() -> void:
	canvas_group.material.set_shader_parameter("line_thickness", 10.0)
	var tween := create_tween()
	tween.tween_method(set_outline_thickness, 5.0, 10.0, 0.08)


func _on_mouse_exited() -> void:
	canvas_group.material.set_shader_parameter("line_thickness", 5.0)
