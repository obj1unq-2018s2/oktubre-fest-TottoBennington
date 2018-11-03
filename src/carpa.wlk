import jarra.*
import marcas.*
class Carpa {
	var property capacidad
	var property tocaBanda
	var property marcaDeCerveza
	var personasDentro = #{}
	
	method esPosibleIngresar(persona){
		return self.capacidad() < self.cantidadDePersonas()
			   and
			   not persona.estaEbrio()
	}
	
	method cantidadDePersonas() = personasDentro.size()
	
	method ingresarPersona(persona){
		if(self.esPosibleIngresar(persona) and persona.quiereEntrarACarpa(self)){
			personasDentro.add(persona)
		}else if(persona.estaEbrio()){self.error("No permitimos gente ebria")}
		else if(self.cantidadDePersonas() == capacidad){self.error("Lleno")}
	}
	
	method cantidadDeEbriosEmpedernidos(){
		return personasDentro.filter{
			persona => persona.soyEbrioEmpedernido()
		}.size()
	}
}