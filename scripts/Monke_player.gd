extends CharacterBody2D

const predkosc: int = 150

var rotacja_var: int = 0
var rotacja = 100

var czy_banana_attack:bool = true
signal one_banana_thrown(pozycja, kierunek)

var czy_coconut_attack:bool = true
signal one_kokos_throw(pozycja, kierunek)

func _process(_delta):
	
	#position.x += predkosc * delta
	
	#print(delta) zmienia sie dynamicznie do ilosci fps'ow
	
	#rotacja & rozciaganie wraz z ruchem
#	if Input.is_action_pressed("down") || Input.is_action_pressed("up") || Input.is_action_pressed("left") || Input.is_action_pressed("right"):
#		rotation_degrees += rotacja * delta
#		rotacja_var += rotacja
#		if rotacja_var < 180*50:
#			if rotacja_var > 130*50:
#				skew += 0.03
#		if rotacja_var > 200*50:
#			if rotacja_var < 250*50:
#				skew -= 0.03
#		if rotacja_var == 360*50:
#			rotacja_var = 0
			
	#petla przestrzenna
#	if position.x > 1250:
#		position.x = -100
#	if position.x < -110:
#		position.x = 1240
#	if position.y > 700:
#		position.y = -100
#	if position.y < -110:
#		position.y = 690
		
	#movement
	var kierunek = Input.get_vector("left","right","up","down")
	velocity = kierunek * 200
	move_and_slide() #automatycznie *delta
	#jesli Node2D to position = kierunek*delta*const
	
	#banana attack message
	#rzut bananem i cooldown
	if Input.is_action_just_pressed("banana_throw") && czy_banana_attack:
		#wylosowac 1z3 Marker2D
#		var punkty_bananowe = $Banana_start_position.get_children()
#		var wybrany_punkt_bananowy = punkty_bananowe[randi() % punkty_bananowe.size()] #oraz .global_position w emit()
		var punkt = $Marker2D.global_position
		czy_banana_attack = false
		$Timer.start()
		#emitowanie wylosowanego
		var direction:Vector2 = (get_global_mouse_position() - position).normalized()
		one_banana_thrown.emit(punkt, direction)
	#rzut kokosem i cooldown
	if Input.is_action_just_pressed("coconut_throw") && czy_coconut_attack:
		var punkt = $Marker2D.global_position
		czy_coconut_attack = false
		$Timer2.start()
		var direction:Vector2 = (get_global_mouse_position() - position).normalized() #im dalej myszka tym wieksza predkosc co nie ma sensu wiec wektor jednostkowy
		one_kokos_throw.emit(punkt, direction)
		
	#rotacja monke w strone myszki
	look_at(get_global_mouse_position()) #btw domyslnie w x+

func _on_timer_timeout(): #bruh funckje poza petla tez dzialaja jak sa petlami/timerami
	czy_banana_attack = true
func _on_timer_2_timeout():
	czy_coconut_attack = true
