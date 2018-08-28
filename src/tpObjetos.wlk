//Punto 1
object rolando {
	const nombre = "Rolando"
	const hechiceriaBase = 3
	const hechizoPreferido = []
	const fuerzaOscura = 5
	
	
method agregarHechizo(unHechizo) {
	hechizoPreferido.clear()
	hechizoPreferido.add(unHechizo)
}

method poderHechizoPreferido = hechizo(unHechizo.poder)

method hechizo() = hechizoPreferido 

method nivelHechizeria() = (hechiceriaBase*hechizoPreferido)+fuerzaOscura
	
}

object espectroMalefico {
	const poder = 17
	const poderoso = true
}

object hechizoBasico {
	const poder = 10
	const poderoso = false
}
