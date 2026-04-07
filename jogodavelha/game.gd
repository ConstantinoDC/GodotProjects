extends Control

var jogador1 = "X"
var quadro = []

@onready var botoes = $GridContainer.get_children()

func _ready():
	for i in range(9):
		quadro.append("")
		botoes[i].pressed.connect(_on_button_pressed.bind(i))
		
func _on_button_pressed(index):
	if quadro[index] != "":
		return
	
	print("Botão ", index, " pressionado")
	quadro[index] = jogador1
	botoes[index].text = jogador1
	
	if check_vencedor():
		print("Vencedor: ", jogador1)	
		reset_game()
		return
		
	if check_velha():
		print("Velha")
		reset_game()
		return
	
	jogador1 = "O" if jogador1 == "X" else "X"

func check_vencedor():
	var wins = [
		[0, 1, 2], [3, 4, 5], [6, 7, 8],
		[0, 3, 6], [1, 4, 7], [2, 5, 8],
		[0, 4, 8], [2, 4, 6]
	]
	
	for combo in wins:
		if quadro[combo[0]] != "" and quadro[combo[0]] == quadro[combo[1]] and quadro[combo[1]] == quadro[combo[2]]:
			return true
			
	return false
	
func reset_game():
	for i in range(9):
		quadro[i] = ""
		botoes[i].text = ""
		
	jogador1 = "X"
	
func check_velha():
	for i in range(9):
		if quadro[i] == "":
			return false
	return true 
