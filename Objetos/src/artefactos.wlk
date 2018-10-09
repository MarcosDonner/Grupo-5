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

class MascarasOscuras {

	var unidadFuerzaOscura
	var unidadesDeLucha = 0
	var nivelDeOscuridad = 4

	method poderArtefacto(fuerzaOscura) {
		if(mundo.fuerzaOscura()<= 5)
		unidadesDeLucha = 4.max(fuerzaOscura / 2)
		else{
			unidadesDeLucha = 5
		}
	}
    method cambiarNivelDeOscuridad(nuevoValorDeOscuridad) {
    	nivelDeOscuridad = nuevoValorDeOscuridad
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

/* Posible mercado que no pude ponerlo en una clase Mercado gracias a Wollok :)
class Mercado {
	var costoHechizosBasicos = 10
	var costoHechizosLogos = poder(hechizo)
	var costoEspadasYSimilares = 5*unidadesDeLucha(unArma)
	var costoCollarDivino = 2*cantidadPerlas
	var costoArmaduraConCota = unidadDeLucha/2
	var costoArmaduraConBendicion = valorBaseDeArmadura
	var costoArmaduraConHechizo = valorBaseDeLaArmadura
	var costoArmaduraSinRefuerzo = 2
	var costoEspejoFantastico = 90
	}

*/
	*/