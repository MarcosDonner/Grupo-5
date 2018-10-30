import artefactos.*
import hechizos.*

object mundo{
	var fuerzaOscura = 5
	method eclipse(){
		fuerzaOscura = fuerzaOscura *2
	}
	method fuerzaOscura() = fuerzaOscura
}
class Personaje {

	const nombre = "Rolando"
	var hechiceriaBase = 3 // lo puse variable por si luego rolando cambia hechizo, (asi ademas darle un setter jaja)
	var property hechizoPreferido

	var property habilidadLucha = 1
	var property artefactos = []
	var  puntosDeLuchaDelMejorArtefacto = 0
	var armadura
	
	var property monedas = 100
	var hechizoCanjeado
	var reconocerMitadPrecioHechizo
	
	method hechiceriaBase() = hechiceriaBase // get

	method hechiceriaBase(unHechizoBase) { // set
		hechiceriaBase = unHechizoBase
	}

	method hechizo() = hechizoPreferido

	method cambiarHechizoPreferido(unHechizo){
		hechizoPreferido = unHechizo
	}

	method poderHechizoPreferido() = self.hechizoPreferido().poder()


	method nivelHechizeria() = (hechiceriaBase * self.poderHechizoPreferido()) + mundo.fuerzaOscura()

	method poderoso() {
		self.poderHechizoPreferido().esPoderoso()
	}

	method agregaArtefactos(unArtefacto) {
		artefactos.addAll(unArtefacto)
	}
	method limpiaArtefactos(){
		artefactos.clear()
	}
	
	//este method esta ahora para cambiar la habiliad de lucha , proveniente de HECHIZO 
	method habilidadLucha(unaHabilidad) { 
		habilidadLucha = unaHabilidad
	}

	method habilidadLucha() = habilidadLucha

	method obtenerPoderDeLosArtefactos(){
		return artefactos.sum({artefacto => artefacto.aporteLucha(self)})
	}
	
	
	//arreglar self.puntosDeLuchaDelMejorArtefacto() ya que al ponerlo me caga el LuchaTest cambia los valores
	// entonces donde sumo los valores del mejor Artefacto?
	method lucha(){
		habilidadLucha = self.habilidadLucha() + self.obtenerPoderDeLosArtefactos() 
	}

	method habilidadLuchaMayorHechiceria(){
		return self.habilidadLucha() > self.nivelHechizeria()
	}
	
	method armadura(unaArmadura) { // por si tengo que cambiar armadura
		armadura = unaArmadura
	}
	method estaCargado(){
		return self.artefactos().size() >= 5
	}
	method eliminarArtefacto(unArtefacto){
		artefactos.remove(unArtefacto)
	}

	method puntosDeLuchaDelMejorArtefacto(){
		return self.mejorArtefacto().aporteLucha(self) // devuelve un valor de APORTE DE LUCHA, que luego sera sumado junto con self.obtenerPoderDeLosArtefactos()
	}
	
	method mejorArtefacto(){
		return self.artefactosSinEspejo().max({artefacto => artefacto.aporteLucha(self)})
	}
	method artefactosSinEspejo(){ // para filtrarme aquellas lista sin espejoFantastico
		return artefactos.filter({artefacto => !(artefacto.equals(espejoFantastico))})
	}
	// " si SOLO TUVIERA al espejoFantastico, su aporte de lucha seria nulo
	method tieneSoloEspejo(){
		return artefactos == [espejoFantastico]
	}
	
	//
	method canjearHechizoPorProducto(unProducto){
		reconocerMitadPrecioHechizo = hechizoCanjeado.precioDeLista() / 2  // veremos como se lo cambia . Edit: y que sucede con esto?
		if(self.loPuedoComprar(unProducto)){
			self.cambiarHechizoPreferido(unProducto) // se vuelve el preferido al canjear hechizo
			self.restarMonedero(reconocerMitadPrecioHechizo)
		}
	}
	
	method canjearArtefactos(unProducto){
		if(self.loPuedoComprar(unProducto)){
			self.agregaArtefactos(unProducto)
			 self.restarMonedero(unProducto.precioDeLista())
		}
	}
	method loPuedoComprar(unProducto){
		return unProducto.precioDeLista(self)<= self.monedas()
	}
	method restarMonedero(unaCantidad){
		return self.monedas((self.monedas() - unaCantidad).max(0)) // no comments sobre los issues  jajajaa
	}
	
}


