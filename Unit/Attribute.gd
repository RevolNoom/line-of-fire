extends Node
# Define the most basic attributes

export var Value = 0
export var Base = 0
export var Max = 0

signal Exhausted

func _ready():
	Max = Base


func GetValue():
	return Value
	
func GetBase():
	return Base
	
func GetMax():
	return Max



func Increase(amount):
	Value = clamp(Value + amount, 0, Max)
	if Value == 0:
		emit_signal("Exhausted")
	
	
func Decrease(amount):
	Increase(-amount)
	

func Grow(amount):
	Max = clamp(Max + amount, 0, Max)
	if Value > Max:
		Decrease(Value - Max)
	
	
func Shrink(amount):
	Grow(-amount)
