class Carpa {
	var property capacidad
	var property tocaBanda

}

class Jarra {
	var property capacidad
	var property marca
}

class Persona {
	var property peso
	var jarrasDeCervezaCompradas = #{}
	var property gustoPorLaMusicaTradicional
	var property nivelDeAguante
	// dependiendo de las marcas que le gusten podes darte cuenta de que pais es
	method estaEbrio(){
		//return 
	}
}

class MarcaRubia {
	var property lupulo //gramos x litro
	var property paisDeOrigen
	var property graduacion
}

class MarcaNegra {
	var property lupulo //gramos x litro
	var property paisDeOrigen
	method graduacion() = graduacionReglamentaria.graduacion().min(lupulo * 2)
}

class MarcaRoja inherits MarcaNegra{
	override method graduacion() = super() * 1.25
}

object graduacionReglamentaria{
	var property graduacion
}