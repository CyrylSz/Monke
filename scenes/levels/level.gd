extends Node2D

#funkcje
#func funkcja_testowa(param1: int, parm2: bool, parm3: Array[float]) -> bool: #if nie sprecyzujesz to void
#	return true #tu if,while,for,comparison (jeszcze continue i break ale raczej unikaj)
#func _ready():
	#print("level") #niczym funkcje/matryce nody procesuja sie od najnizszego/najglebszego do najwyzszego/najogolniejszego
#	var pozycja:Vector2 = Vector2(100,400)
#	$Monke.position = pozycja
#
#	var Lista_skryptow:Array[String] = ["banan","monke","level"]
#	for i in Lista_skryptow:
#		print(i)

var banana_throw_level: PackedScene = preload("res://scenes/projectiles/flying_banana.tscn")
func _on_monke_player_one_banana_thrown(pozycja, kierunek):
	var banana = banana_throw_level.instantiate() as Area2D
	$Projectiles.add_child(banana) #adding to the node tree
	banana.position = pozycja
	banana.rotation_degrees = rad_to_deg(kierunek.angle()) #lub rotation w rad
	banana.direction = kierunek

var coconut_throw_level: PackedScene = preload("res://scenes/projectiles/flying_coconut.tscn")
func _on_monke_player_one_kokos_throw(pozycja, kierunek):
	var coconut = coconut_throw_level.instantiate() as RigidBody2D
	$Projectiles.add_child(coconut)
	coconut.position = pozycja
	coconut.linear_velocity = kierunek*750

#banana licznik
var banans: int = 0
func _on_banana_basket_plus_one_banana():
	banans += 1
	print("ilosc bananow:")
	print(banans)
	if banans >= 10:
		print("max banans!")
		banans = 9
