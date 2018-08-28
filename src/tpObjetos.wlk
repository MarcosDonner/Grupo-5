//Punto 1
object rolando {

	const nombre = "Rolando"
	var hechiceriaBase = 3 // lo puse variable por si luego rolando cambia hechizo, (asi ademas darle un setter jaja)
	const hechizoPreferido = []
	var fuerzaOscura = 5
	const artefactos=[]
	var habilidadLucha = 1

	method hechiceriaBase() = hechiceriaBase //get

	method hechiceriaBase(unHechizoBase) { //set
		hechiceriaBase = unHechizoBase
	}

	method hechizo() = hechizoPreferido

	method agregarHechizo(unHechizo) {
		hechizoPreferido.clear()
		hechizoPreferido.addAll(unHechizo)
	}

	method poderHechizoPreferido() = hechizoPreferido.first().poder()

	method nivelHechizeria() = (hechiceriaBase * self.poderHechizoPreferido()) + fuerzaOscura

	method poderoso() {
		self.poderHechizoPreferido().esPoderoso()
	}

	method enclipsamiento() {
		return fuerzaOscura * 2
	}

	method agregaArtefactos(unArtefacto) {
		artefactos.clear()
		artefactos.addAll(unArtefacto)
	}

	method habilidadLucha(unaHabilidad) {
		habilidadLucha = unaHabilidad
	}

	method habilidadLucha() = habilidadLucha

/* 
 * method sumar
 * method habilidadAlLuchar(){
 * 	habilidadLucha + self.artefactos().sum({})
 * }
 */
}

/* ************************************** PODERES ************************** */
object espectroMalefico {

	const poder = 17
	const poderoso = true

	method poder() = poder

	method esPoderoso() = poderoso

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

/* 
 * object collarDivino{
 * 	var unidadesPerlas
 * 	var unidadesDeLucha
 * 	method aporteLucha(cantidadPerlas){
 * 		unidadesDeLucha += unidadesDeLucha
 * 	}
 * }
 * object mascaraOscura{
 * 	var unidadFuerzaOscura
 * 	method aporteLucha(fuerzaOscura) = 4.min(unidadFuerzaOscura/2)	
 * }

 */
