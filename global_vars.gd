extends Node

var maxJumps
var canDoubleJump
var portalActive

func _ready() -> void:
	maxJumps = 1
	canDoubleJump = 0.0
	portalActive = 0.0
	
func _process(delta: float) -> void:
	if canDoubleJump > 0.0:
		print(canDoubleJump)
		maxJumps = 2
		canDoubleJump = canDoubleJump - delta
	else:
		maxJumps = 1
		
	if portalActive > 0.0:
		print(portalActive)
		portalActive = portalActive - delta
