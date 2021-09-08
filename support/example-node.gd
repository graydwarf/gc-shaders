extends Button

func SetText(t):
	self.text = t

func _on_ExampleNode_pressed() -> void:
	Signals.emit_signal("LoadExample", self.text)
