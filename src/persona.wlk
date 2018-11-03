import jarra.*
import marcas.*
import carpa.*
class Persona {
	var property peso
	var jarrasDeCervezaCompradas = #{}
	var property gustoPorLaMusicaTradicional
	var property nivelDeAguante
	
	method nacionalidad()
	
	method estaEbrio(){
		return self.totalDeAlcoholIngerido() * peso > nivelDeAguante
	}
	
	method totalDeAlcoholIngerido(){
		return jarrasDeCervezaCompradas.sum{
			jarra => jarra.graduacion()
		}
	}
	
	method esMarcaDeMiGusto(marca)
	
	method quiereEntrarACarpa(carpa){
		return self.esMarcaDeMiGusto(carpa.marcaDeCerveza())
			   and
			   carpa.tocaBanda() && self.gustoPorLaMusicaTradicional()
	}
	
	method puedeEntrarEn(carpa){
		return self.quiereEntrarACarpa(carpa) and carpa.esPosibleIngresar(self)
	}
	
	method soyEbrioEmpedernido(){
		return jarrasDeCervezaCompradas.size() > 0 and
			   jarrasDeCervezaCompradas.all{
			       jarra => jarra.capacidad() == 1
			   }
	}
	
	method esPatriota(){
		return jarrasDeCervezaCompradas.all{
			jarra => jarra.marca().paisDeOrigen() == self.nacionalidad()
		}
	}
}

class PersonaDeNacionalidadBelga inherits Persona{
	override method nacionalidad() = "Belgica"
	override method esMarcaDeMiGusto(marca){
		return marca.lupulo() > 4
	}
	
}
class PersonaDeNacionalidadCheca inherits Persona{
	override method nacionalidad() = "RepublicaCheca"
	override method esMarcaDeMiGusto(marca){
		return marca.graduacion() > 8
	}
}
class PersonaDeNacionalidadAlemana inherits Persona{
	override method nacionalidad() = "Alemania"
	override method esMarcaDeMiGusto(marca) = true
	override method quiereEntrarACarpa(carpa) = super(carpa) and carpa.cantidadDePersonas() % 2 == 0
}