import artefactos.*
import hechizos.*

object mundo{
	var fuerzaOscura = 5
	method eclipse(){
		fuerzaOscura = fuerzaOscura *2
	}
	method fuerzaOscura() = fuerzaOscura
}
object rolando {

	const nombre = "Rolando"
	var hechiceriaBase = 3 // lo puse variable por si luego rolando cambia hechizo, (asi ademas darle un setter jaja)
	const libroDeHechizos = []

	var property habilidadLucha = 1
	var property artefactos = []
	var  puntosDeLuchaDelMejorArtefacto = 0
	var armadura

	method hechiceriaBase() = hechiceriaBase // get

	method hechiceriaBase(unHechizoBase) { // set
		hechiceriaBase = unHechizoBase
	}

	method hechizo() = libroDeHechizos

	method agregaHechizo(unHechizo) {
	
		libroDeHechizos.addAll(unHechizo)
	}
	method limpiarHechizo(){
		libroDeHechizos.clear()
	}

	method poderHechizoPreferido() = libroDeHechizos.sum({hechizos => hechizos.poder()})


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
	
}


