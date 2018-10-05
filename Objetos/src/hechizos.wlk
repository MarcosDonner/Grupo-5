import example.*

object espectroMalefico {

	var nombre = "espectroMalefico"
	var poder = 17

	method poder() = poder

	method calculoDePoder() {
		poder = self.nombre().size()
	}

	method esPoderoso() = self.poder() > 15

	method nombre() = nombre

	method nombreNuevo(unNuevoNombre) {
		nombre = unNuevoNombre
	}
	method aporteLucha(duenio) =  self.poder()

}

object hechizoBasico {

	const poderoso = false

	method poder() = 10

	method esPoderoso() = poderoso
	
	method aporteLucha(duenio) = self.poder()
}

// hechizo del punto 3
object hechizo{
	var hechizo
	//puede ser espectro malefico o hechizo basico
	method choiseWizards(unHechizo){
		hechizo = unHechizo
	}
	method hechizo() = hechizo
	method aporteLucha(duenio) = hechizo.poder()

}

