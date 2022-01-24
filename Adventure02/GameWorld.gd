extends Node2D
onready var hotspotFile = "res://hotspot.txt"
var hotspotBase = preload("res://HotspotBase.tscn")

func _ready():
	var f = File.new()
	f.open(hotspotFile,File.READ)
	while not f.eof_reached():
		var line = f.get_line()
		var hotSpotProperties = line.split(",")
		var hotspot = hotspotBase.instance()
		hotspot.name = hotSpotProperties[0]
		hotspot.position.x = int(hotSpotProperties[1])
		hotspot.position.y = int(hotSpotProperties[2])
		# Set collision Shape
		var shape = RectangleShape2D.new()
		shape.set_extents(Vector2(int(hotSpotProperties[3])/2, int(hotSpotProperties[4])/2))
		hotspot.get_node("CollisionShape2D").set_shape(shape)
		var spriteImage = load("res://Assets/"+hotSpotProperties[5])
		hotspot.get_node("Sprite").texture = spriteImage
		add_child(hotspot)
	f.close()
