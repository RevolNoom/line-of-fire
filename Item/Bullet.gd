extends RigidBody2D

class_name Bullet

# Objects are entities that appear on the screen, but are not commandable
# Smoke, bullets, missiles (?), terrain,...

func _init():
	add_to_group("object")
	set_visible(false)


func _on_Bullet_body_entered(unit):
	print("Hit something!")
	var damage = Damage.new($Damage.GetValue())
	unit.TakeEffect(damage)
	queue_free()
