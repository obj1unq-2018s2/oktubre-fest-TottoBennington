import jarra.*
import oktubreFest.*
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
	var property graduacion // ingresar en los tests
}