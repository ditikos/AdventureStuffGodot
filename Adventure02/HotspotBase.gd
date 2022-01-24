extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_displayMessage("From base object")
	self.connect("mouse_entered", self, "onMouseHoverIn")
	self.connect("mouse_exited", self, "onMouseHoverOut")
	self.connect("input_event", self, "onMouseEvent")

func _displayMessage(message):
	print(message)
	
func onMouseHoverIn():
	_displayMessage("Mouse Hover In.")

func onMouseHoverOut():
	_displayMessage("Mouse Hover Out.")

func onMouseEvent(viewport:Node, event:InputEvent, shape_idx:int):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("Left mouse click!")
		if event.button_index == BUTTON_RIGHT and event.pressed:
			print("Right mouse click!")
