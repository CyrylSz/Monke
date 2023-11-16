extends CharacterBody2D

func _process(_delta):
	#kierunek
	var a:int = 1
	var b:int = 0
	var kierunek:Vector2 = Vector2(a,b)
	#predkosc
	velocity = kierunek * 100
	#ruch
	move_and_slide()

	#petla przestrzenna
	if position.x > 1250:
		position.x = -50
