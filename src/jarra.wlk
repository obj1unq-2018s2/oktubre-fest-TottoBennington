import marcas.*
import carpa.*
import persona.*
class Jarra {
	var property capacidad // son litros
	var property marca
	
	method contenidoDeAlcohol(){
		return capacidad * marca.graduacion()
	}	
}
