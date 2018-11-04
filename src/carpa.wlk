import jarra.*
import marcas.*
import persona.*
class Carpa {
	var property capacidad
	var property tocaBanda
	var property marcaDeCerveza
	var personasDentro = #{}
	
	method esPosibleIngresar(persona){
		return self.cantidadDePersonas() < self.capacidad()
			   and
			   not persona.estaEbrio()
	}
	
	method cantidadDePersonas() = personasDentro.size()
	
	method ingresarPersona(persona){
		if(self.esPosibleIngresar(persona) and persona.quiereEntrarACarpa(self)){
			personasDentro.add(persona)
		}
		if(persona.estaEbrio()){self.error("No permitimos gente ebria")}
		if(self.cantidadDePersonas() == capacidad){self.error("Lleno")}
	}
	
	method cantidadDeEbriosEmpedernidos(){
		return personasDentro.filter{
			persona => persona.soyEbrioEmpedernido()
		}.size()
	}
}