//Punto 1
object rolando {

	var property nombre = "Rolando"
	var hechiceriaBase = 3 // lo puse variable por si luego rolando cambia hechizo, (asi ademas darle un setter jaja)
	const hechizoPreferido = []
	var fuerzaOscura = 5
	var habilidadLucha = 1
	const artefactos = []

	method hechiceriaBase() = hechiceriaBase // get

	method hechiceriaBase(unHechizoBase) { // set
		hechiceriaBase = unHechizoBase
	}

	method fuerzaOscura(unaFuerza) {
		fuerzaOscura = unaFuerza
	}

	method fuerzaOscura() = fuerzaOscura

	method hechizo() = hechizoPreferido

	method agregaHechizo(unHechizo) {
		hechizoPreferido.clear()
		hechizoPreferido.addAll(unHechizo)
	}

	method poderHechizoPreferido() = hechizoPreferido.first().poder()

// consideramos que ele preferido del "mago" (o lo que fuese) es 
// el primero de su lista de poderes, ya que usando logica, cualquier persona al decir cual objeto, u cosa te gusta mas, 
// siempre decis el que mas te gusta como primero!, cientificamente comprobado jajaj
	method nivelHechizeria() = (hechiceriaBase * self.poderHechizoPreferido()) + self.fuerzaOscura()

	method poderoso() {
		self.poderHechizoPreferido().esPoderoso()
	}

	method enclipsamiento() {
		fuerzaOscura = fuerzaOscura * 2
	}

	method agregaArtefactos(unArtefacto) {
		self.limpiaArtefactos()
		artefactos.addAll(unArtefacto)
	}
	method limpiaArtefactos(){
		artefactos.clear()
	}
	
	
	method habilidadLucha(unaHabilidad) { // creo que este esta demas
		habilidadLucha = unaHabilidad
	}

	method habilidadLucha() = habilidadLucha

// mi idea es que sume los aportes de lucha que tiene cada artefacto y luego sumarlos con la unidad de lucha en method lucha
// claramente mi idea es que desde los objetos de los artefactos pueda aportar su poder propio, modicandolo, etc .. 
// no realice ningun test de lucha
	method obtenerPoderDeLosArtefactos(){
		return artefactos.sum({artefacto => artefacto.aporteLucha()})
	}
	method lucha(){
		habilidadLucha = self.habilidadLucha() + self.obtenerPoderDeLosArtefactos()
	}
	method habilidadLuchaMayorHechiceria(){
		return self.habilidadLucha() > self.nivelHechizeria()
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

	var unidadesDeLucha = 0

	method poderArtefacto() {
		unidadesDeLucha += 3
	}
	method aporteLucha() = unidadesDeLucha

}

object collarDivino {

	var unidadesPerlas 
	var unidadesDeLucha = 0


	method poderArtefacto(cantidadPerlas) {
		unidadesDeLucha += cantidadPerlas
	}

	method aporteLucha() = unidadesDeLucha

}

object mascaraOscura {

	var unidadFuerzaOscura
	var unidadesDeLucha = 0
	var personaje = rolando

	method poderArtefacto(fuerzaOscura) {
		if(personaje.fuerzaOscura()<= 5)
		unidadesDeLucha = 4.max(fuerzaOscura / 2)
		else{
			unidadesDeLucha = 5
		}
	}

	method aporteLucha() = unidadesDeLucha

}