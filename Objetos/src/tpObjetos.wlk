//Punto 1
object rolando {

	const nombre = "Rolando"
	var hechiceriaBase = 3 // lo puse variable por si luego rolando cambia hechizo, (asi ademas darle un setter jaja)
	const hechizoPreferido = []
	var fuerzaOscura = 5
	const artefactos = []
	var habilidadLucha = 1

	method hechiceriaBase() = hechiceriaBase // get

	method hechiceriaBase(unHechizoBase) { // set
		hechiceriaBase = unHechizoBase
	}

	method fuerzaOscura() = fuerzaOscura

	method hechizo() = hechizoPreferido

	method agregarHechizo(unHechizo) {
		hechizoPreferido.clear()
		hechizoPreferido.addAll(unHechizo)
	}

	method poderHechizoPreferido() = hechizoPreferido.first().poder()

	method nivelHechizeria() = (hechiceriaBase * self.poderHechizoPreferido()) + self.fuerzaOscura()

	method poderoso() {
		self.poderHechizoPreferido().esPoderoso()
	}

	method enclipsamiento() {
		fuerzaOscura = fuerzaOscura * 2
	}

	method agregaArtefactos(unArtefacto) {
		artefactos.clear()
		artefactos.addAll(unArtefacto)
	}

	method habilidadLucha(unValorBase) { //modifico a gusto el valor base de lucha de rolando
		habilidadLucha = unValorBase
	}

	method habilidadLucha() = habilidadLucha

// mi idea es que sume los aportes de lucha que tiene cada artefacto y luego sumarlos con la unidad de lucha en method lucha
// claramente mi idea es que desde los objetos de los artefactos pueda aportar su poder propio, modicandolo, etc .. 
// no realice ningun test de lucha
	method obtenerPoderDelArtefacto(){
		return artefactos.sum({artefacto => artefacto.aporteLucha()})
	}
	method lucha(){
		habilidadLucha += self.obtenerPoderDelArtefacto()
	}
}

/* ************************************** PODERES ************************** */
object espectroMalefico {

	var nombre = "espectroMalefico"
	var poder = 17

	// const poderoso  
	method poder() = poder

	method calculoDePoder() {
		poder = self.nombre().size()
	}

	method esPoderoso() = self.poder() > 15

	method nombre() = nombre

	method nombreNuevo(unNuevoNombre) {
		nombre = unNuevoNombre
	}

}

object hechizoBasico {

	const poder = 10
	const poderoso = false

	method poder() = poder

	method esPoderoso() = poderoso

}

/* ***************************************** LUCHA ****************************** */
object espadaDeDesierto {

	var unidadesDeLucha

	method aporteLucha() {
		unidadesDeLucha += 3
	}

}

object collarDivino {

	var unidadesPerlas
	var unidadesDeLucha

	method poderArtefacto(cantidadPerlas) {
		unidadesDeLucha += unidadesPerlas
	}

	method aporteLucha() = unidadesDeLucha

}

object mascaraOscura {

	var unidadFuerzaOscura
	var unidadesDeLucha

	method poderArtefacto(fuerzaOscura) {
		unidadesDeLucha = 4.min(fuerzaOscura / 2)
	}

	method aporteDeLucha() = unidadesDeLucha

}

