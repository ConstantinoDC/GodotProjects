extends CharacterBody2D

@export var y_speed = -250
@export var angle = [-200, -250, 250, 300]
# @export var angle = [-10000]

# Probabilidade de 20% para gera um item 
@export var drop_probability = 0.2

# Pré carregar a cena do item coletável
@export var item_scene = preload("res://Scenes/item_power_up.tscn")

func _physics_process(delta):
	if Input.is_action_pressed("Start") and !GameManager.started:
		play_game()
		
	if GameManager.started:
		var collision = move_and_collide(velocity * delta)
		if collision != null:
			velocity =  velocity.bounce(collision.get_normal())
			
			var collided_object = collision.get_collider()
			
			if "Block" in collided_object.name:
				collided_object.queue_free()
				GameManager._add_points(5)
				spawn_item(collision.get_position())
				
			spawn_item(collision.get_position())
			
			
		
func play_game():
	GameManager.started = true
	velocity = Vector2(angle.pick_random(), y_speed)
	
func spawn_item(position_item:Vector2):
	# Sorteia se deve gerar um item coletável
	
	if randf() < drop_probability: # Cria o item coletável
		# Instanciar o item coletável
		var item = item_scene.instantiate()
		
		# Define a posição do item coletável
		item.position = position_item
		
		get_parent().add_child(item)
		
func reset_position():
	var player = get_parent().get_node("Player")
	position = player.position
	position = player.position + Vector2(0, -25)
	GameManager.started = false
	
	
