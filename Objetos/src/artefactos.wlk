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

class Mascaras{

	var property indiceOscuridad 
	var unidadesDeLuchaMinimo = 4
	var valorLucha
	method poderArtefacto() {
		if(mundo.fuerzaOscura()<= 5)
		valorLucha = unidadesDeLuchaMinimo.max(mundo.fuerzaOscura() / 2) * self.indiceOscuridad()
		else{
			valorLucha = 5
		}
	}
	method modificarIndice(unIndice) {
		indiceOscuridad = unIndice
	}
	method modificarUnidadLuchaMinimo(nuevaUnidad){
		unidadesDeLuchaMinimo = nuevaUnidad
	}

	method aporteLucha(duenio) = valorLucha

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
class CotaDeMalla{
	var property cantidad
	method cantidadAporte(unaCantidad){
		cantidad = unaCantidad
	}
	method aporteLucha(duenio) = return cantidad
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
	