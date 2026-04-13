extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -200.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
			
	if direction < 0:
		$Sprite2D.flip_h = true
	elif direction > 0:
		$Sprite2D.flip_h = false 
		
	move_and_slide()	


func _on_trofeu_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/vitoria.tscn")

func _on_hitbox_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/perdeu.tscn")
