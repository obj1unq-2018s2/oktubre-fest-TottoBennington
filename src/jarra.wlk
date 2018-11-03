import marcas.*
import oktubreFest.*
class Jarra {
	var property capacidad
	var property marca
	
	method contenidoDeAlcohol(){
		return capacidad * marca.graduacion()
	}	
}
