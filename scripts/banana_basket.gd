extends StaticBody2D


signal plus_one_banana #btw mozesz emitowac wartosci np. plus_one_banana(body) itd.

func _on_area_2d_body_entered(body):
	if body != $".":
		plus_one_banana.emit()
