import Personaje.*

class HechizoLogos {

	var property nombre = "espectroMalefico"
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
	method peso() = 0

}

object hechizoBasico {

	const poderoso = false

	method poder() = 10

	method esPoderoso() = poderoso
	
	method aporteLucha(duenio) = self.poder()
	
	//
	method precioDeLista(duenio) = 10 
	/*method peso() {
		if (self.poder() < 10){
			
		}
	}
	 
	*/ 
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
	method peso(){
		if(self.hechizo().even()){
			return 2
		}
		else{
			return 1
		}
	}
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
//
class HechizoComercial inherits HechizoLogos{
	var property multiplicador = 2
	override method aporteLucha(duenio) = self.poder()* 0.2 * self.multiplicador()
}

