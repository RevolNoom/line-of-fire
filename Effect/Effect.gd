extends Node
class_name Effect

# VISITOR
# Defines multiple ways an Action, Object can
# manipulate an Unit's Attributes
# 
# Effects are responsible to free itself after 
# it has done its work


func AffectOnInfantry(_unit):
	printerr("OVERRIDE ME: AffectOnInfantry(unit) for " + self.get_path())


#func AffectOnInfantry(unit):
#	printerr("OVERRIDE ME: AffectOnInfantry(unit) for " + self.get_path())
