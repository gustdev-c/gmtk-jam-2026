extends ProgressBar

@onready var label: Label = $Label
var id

func _ready() -> void:
	id = self.get_meta("id")

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	match id:
		1:
			self.value = global.canDoubleJump
		2:
			self.value = global.portalActive
		3:
			self.value = global.canJump
	
	if self.value > 0.0:
		self.visible = true
	else:
		self.visible = false



func _on_visibility_changed() -> void:
	match id:
		1:
			self.max_value = global.canDoubleJump
			label.text = "Double Jump"
		2:
			self.max_value = global.portalActive
			label.text = "Portal"
		3:
			self.max_value = global.canJump
			label.text = "Jump"
