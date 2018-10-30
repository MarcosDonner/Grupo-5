import Personaje.*
class Armas {
//
//	var unidadesDeLucha = 0

	method aporteLucha(duenio) {
		return  3
	}
//	method aporteLucha() = unidadesDeLucha

	//
	method precioDeLista(duenio) = 5* self.aporteLucha(duenio)

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
	//
	method precioDeLista(duenio) = self.cantidadPerlas() *2
	

}
//arreglar este tema por que cambia condiciones de la mascarasOscuras
// donde cornoque meto el cambio de valorDeLucha?
class Mascaras{

	var property indiceOscuridad 
	var unidadesDeLuchaMinimo = 4
	var valorLucha
	method poderArtefacto() {
		if(mundo.fuerzaOscura()<= 5)
		valorLucha = unidadesDeLuchaMinimo.max((mundo.fuerzaOscura() / 2) * self.indiceOscuridad())
		else{
			valorLucha = 5
		}
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
	//
	method precioDeLista(duenio) = refuerzo.precioDelRefuerzo(duenio)
	
}
object sinRefuerzo{
	method aporteLucha(duenio) = 0
	
	method precioDelRefuerzo(duenio) = 2
}

// artefacto del punto 3
class CotaDeMalla{
	var property cantidad
	method cantidadAporte(unaCantidad){
		cantidad = unaCantidad
	}
	method aporteLucha(duenio) =  cantidad
	//
	method precioDelRefuerzo(duenio) = self.aporteLucha(duenio) / 2 
}

// sieneto que aporte de lucha tengo que agregarle como parametro duenio, en el cual ese duenio me dara su nivel de hechiceria
// ya que no sera solo rolando, podria ser cualquiera , lo dejo pero tal vez se deba cambiar
//28/09 edit: como la bendicion dependia de cada personaje, le paso como parametro al DUENIO y que este llame a su nivel de hechiceria
object bendicion{
	var unidadDeLucha
	var unaArmadura // por que dice que el precio del refuerzo es el aporte de lucha  BASE de la armadura (sin el refuerzo)
	method aporteLucha(duenio) = return duenio.nivelHechizeria()
	//
	method precioDelRefuerzo(duenio) =  unaArmadura.aporteLucha()
}
object espejoFantastico{
	method aporteLucha(duenio){
		if(duenio.tieneSoloEspejo()) {
			return 0
		}else{
			return duenio.puntosDeLuchaDelMejorArtefacto()
		}
	}
	//
	method precioDeLista(duenio) = 90
	
}
/*
class Espejo{
	method puntosDeLuchaDelMejorArtefacto(duenio){
		return self.mejorArtefacto(duenio).aporteLucha(duenio) // devuelve un valor de APORTE DE LUCHA, que luego sera sumado junto con self.obtenerPoderDeLosArtefactos()
	}
		// " si SOLO TUVIERA al espejoFantastico, su aporte de lucha seria nulo
	method tieneSoloEspejo(duenio){
		return duenio.artefactos() == [espejoFantastico]
	}
	method mejorArtefacto(duenio){
		return self.artefactosSinEspejo(duenio).max({artefacto => artefacto.aporteLucha(duenio)})
	}
	method artefactosSinEspejo(duenio){ // para filtrarme aquellas lista sin espejoFantastico
		return duenio.artefactos().filter({artefacto => !(artefacto.equals(espejoFantastico))})
	}
} 
*/	

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
	