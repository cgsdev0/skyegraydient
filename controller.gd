extends Node2D

var mat: ShaderMaterial

func _ready():
	mat = $ColorRect.material


func _on_rotation_value_changed(value):
	mat.set_shader_parameter("rotation", value)

func _on_amount_value_changed(value):
	mat.set_shader_parameter("amount", value)

func _on_mode_item_selected(index):
	mat.set_shader_parameter("colors", index + 1)
