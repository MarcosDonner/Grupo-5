import artefactos.*
import Comerciante.*
import hechizos.*
import Personaje.*

class PesoArtefacto {
	var property peso //arreglar
	var property fechaCompra = new Date() 
	var property fechaActual = new Date()
	
	method pesoTotal()= self.peso() - self.factorCorreccion() 
	
	method factorCorreccion() = (self.diasDesdeQueLoCompro()/1000).max(1)
	
	method diasDesdeQueLoCompro() = self.fechaActual() - self.fechaCompra()
}
