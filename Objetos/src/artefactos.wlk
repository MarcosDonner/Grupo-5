import Personaje.*
class Armas {
//
//	var unidadesDeLucha = 0

	method aporteLucha(duenio) {
		return  3
	}
//	method aporteLucha() = unidadesDeLucha

}

object collarDivino {

	var property cantidadPerlas = 0
	// var unidadesDeLucha = 0

	method aporteLucha(duenio) {
		return cantidadPerlas
	}
	method cantidadDePerlas(unidadesPerlas){
		cantidadPerlas = unidadesPerlas
	}
	

}
//arreglar este tema por que cambia condiciones de la mascarasOscuras
// donde cornoque meto el cambio de valorDeLucha?
class MascarasOscuras {

	var unidadFuerzaOscura
	var unidadesDeLucha = 0

	method poderArtefacto(fuerzaOscura) {
		if(mundo.fuerzaOscura()<= 5)
		unidadesDeLucha = 4.max(fuerzaOscura / 2)
		else{
			unidadesDeLucha = 5
		}
	}

	method aporteLucha(duenio) = unidadesDeLucha

}
class Armadura{
	var property refuerzo = sinRefuerzo
	var property aporteLucha = 2
	method obtencionRefuerzo(unRefuerzo){
		refuerzo = unRefuerzo
	}
	method refuerzo() = refuerzo
	method aporteLucha(duenio) {
		return self.aporteLucha() + self.refuerzo().aporteLucha(duenio)
	}
}
object sinRefuerzo{
	method aporteLucha(duenio) = 0
}

// artefacto del punto 3
object cotaDeMalla{

	method aporteLucha(duenio) = return 1
}

// sieneto que aporte de lucha tengo que agregarle como parametro duenio, en el cual ese duenio me dara su nivel de hechiceria
// ya que no sera solo rolando, podria ser cualquiera , lo dejo pero tal vez se deba cambiar
//28/09 edit: como la bendicion dependia de cada personaje, le paso como parametro al DUENIO y que este llame a su nivel de hechiceria
object bendicion{
	var unidadDeLucha

	method aporteLucha(duenio) = return duenio.nivelHechizeria()
}
object espejoFantastico{
	method aporteLucha(duenio){
		if(duenio.tieneSoloEspejo()) {
			return 0
		}else{
			return duenio.puntosDeLuchaDelMejorArtefacto()
		}
	}
}