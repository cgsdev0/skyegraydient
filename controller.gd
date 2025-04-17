extends Node2D

var mat: ShaderMaterial
var grad2: Gradient
var grad3: Gradient

var colors = []
func _ready():
	colors.push_back($HBoxContainer/ColorPickerButton1.color)
	colors.push_back($HBoxContainer/ColorPickerButton2.color)
	colors.push_back($HBoxContainer/ColorPickerButton3.color)
	mat = $ColorRect.material
	grad2 = mat.get_shader_parameter("gradient2").gradient
	grad3 = mat.get_shader_parameter("gradient3").gradient
	update_gradients()

func update_gradients():
	grad2.colors[0] = colors[0]
	grad2.colors[1] = colors[1]
	
	grad3.colors[0] = colors[2]
	grad3.colors[1] = colors[0]
	grad3.colors[2] = colors[1]
	grad3.colors[3] = colors[2]
	
func _on_rotation_value_changed(value):
	mat.set_shader_parameter("rotation", value)

func _on_amount_value_changed(value):
	mat.set_shader_parameter("amount", value)

func _on_mode_item_selected(index):
	mat.set_shader_parameter("colors", index + 1)


func _on_color_picker_button_1_color_changed(color, idx):
	colors[idx] = color
	update_gradients()
