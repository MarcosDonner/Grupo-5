import Personaje.*

class HechizoLogos {

	var nombre = "espectroMalefico"
	//he aqui, arreglar el poder que desde ese metoido se le calcule 
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
	
	//
	method precioDeLista(duenio) = self.poder() // repite, pero para que se entienda que habla para la venta

}

object hechizoBasico {

	const poderoso = false

	method poder() = 10

	method esPoderoso() = poderoso
	
	method aporteLucha(duenio) = self.poder()
	
	//
	method precioDeLista(duenio) = 10 
	
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

class LibroHechizos{
	var property libroDeHechizos  

	method agregaHechizo(unHechizo) {
	
		libroDeHechizos.addAll([unHechizo])

	}
	method limpiarHechizo(){
		libroDeHechizos.clear()
	}
	
	method poderHechizos() = libroDeHechizos.sum({hechizos => hechizos.poder()})
	
	//
	method precioDeHechizo(duenio) = 10 * self.cantidadHechizos() + self.sumaHechizos()
	
	method cantidadHechizos() = self.libroDeHechizos().size()
	method sumaHechizos() = self.poderHechizos()
}


