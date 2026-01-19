extends CanvasLayer
class_name DialogUI

@onready var dialog_panel: Panel = $DialogBox
@onready var text_label: Label = $DialogBox/Label

# Signal to notify when dialog is closed
signal dialog_finished

func _ready() -> void:
	# Hide by default
	hide_dialog()

func show_text(text: String) -> void:
	dialog_panel.visible = true
	text_label.text = text
	# Ensure input processing is enabled for closing
	set_process_input(true)

func hide_dialog() -> void:
	dialog_panel.visible = false
	text_label.text = ""
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if dialog_panel.visible:
		if event.is_action_pressed("confirm") or event.is_action_pressed("interact"):
			hide_dialog()
			# Allow input to propagate only if needed, but consume here to prevent re-triggering
			get_viewport().set_input_as_handled()
			dialog_finished.emit()
