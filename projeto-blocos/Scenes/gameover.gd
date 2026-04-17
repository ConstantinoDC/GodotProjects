extends Sprite2D

@onready var timer_reset_2: Timer = $TimerReset2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer_reset_2.start()

func _on_timer_timeout() -> void:
	GameManager.started = false
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
