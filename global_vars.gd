extends Node

var maxJumps
var canJump
var canDoubleJump
var portalActive

func _ready() -> void:
	maxJumps = 0
	canJump = 0.0
	canDoubleJump = 0.0
	portalActive = 0.0

func _process(delta: float) -> void:
	if canJump > 0.0:
		maxJumps = 1
		canJump = canJump - delta
	else:
		if canDoubleJump > 0.0:
			maxJumps = 2
		else:
			maxJumps = 0
	
	if canDoubleJump > 0.0:
		maxJumps = 2
		canDoubleJump = canDoubleJump - delta
	else:
		if canJump > 0.0:
			maxJumps = 1
		else:
			maxJumps = 0
		
	if portalActive > 0.0:
		portalActive = portalActive - delta
