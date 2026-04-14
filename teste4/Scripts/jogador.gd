extends CharacterBody2D

var speed = 200  

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed

	move_and_slide()


func _on_vitoria_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/ganhou.tscn")
