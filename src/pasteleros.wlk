class Ingredientes {
	var property cantidad 
	var property nombre 
}
object lucas {
		var property instrumento = batidora
		var property ingredientesTorta = []
		const property ingredientes = [
		new Ingredientes(nombre = "galletita", cantidad = 0.2),
		new Ingredientes(nombre = "huevo", cantidad = 3),
		new Ingredientes(nombre = "frutilla", cantidad = 0.4),
		new Ingredientes(nombre = "chocolate", cantidad = 5),
		new Ingredientes(nombre = "manteca", cantidad = 0.1)
		]
		method cantidadDeIngrediente(nombre){
		if (ingredientes.any{e => e.nombre() == nombre }){
		return (ingredientes.find{e => e.nombre() == nombre }).cantidad()
		} else {
			return 0
		}
	}
			method cantidadDeIngredienteTorta(nombre){
		if (ingredientesTorta.any{e => e.nombre() == nombre }){
		return (ingredientesTorta.find{e => e.nombre() == nombre }).cantidad()
		} else {
			return 0
		}
	}
		method agregaringrediente(unIngrediente){
		ingredientes.add(unIngrediente)
	}	
		method habilidad() {
		return instrumento.suerte() 
	}
	method puedePrepararSuPostreFavorito(){
	return (self.habilidad()) > 10 or ingredientes.all{e => e.cantidad() >= 0.1 }
	}
	method entregaTorta(torta) { // puede entregar todo lo necesario de manteca o lo que tiene de cualquier otro
		ingredientes.forEach{e => if (e.nombre() == 'manteca'){ 
		ingredientesTorta.add(new Ingredientes(nombre = e.nombre(), cantidad = torta.cantidadDeIngrediente('manteca')))
		} else {
		if (torta.ingredientes().any{l => l.nombre() == e.nombre()}){
		ingredientesTorta.add(new Ingredientes(nombre = e.nombre(), cantidad = (e.cantidad()).min(torta.cantidadDeIngrediente(e.nombre()))))
		}	}
		e.cantidad(0)
		}


	}
	method ingredientesUtilizados(){
		var c = 0
	 ingredientesTorta.forEach{e =>c = c + e.cantidad() }
	 return c
	}
	method tiempoCoccion(){
		return 120/ingredientes.size()
	}
}
object marcos {
	var property ingredientesTorta = []
	var property experiencia = 0
	const property ingredientes = [
		new Ingredientes(nombre = "chocolate", cantidad = 1.2),
		new Ingredientes(nombre = "harina", cantidad = 0.4),
		new Ingredientes(nombre = "azucar", cantidad = 0.3)
		]
	method ingredientesUtilizados(){
		var c = 0
	 ingredientesTorta.forEach{e =>c = c + e.cantidad() }
	 return c
	}
	method agregaringrediente(unIngrediente){
		ingredientes.add(unIngrediente)
	}	
	method habilidad(){
		return experiencia + ingredientes.sum({ing => ing.cantidad()})
	}
	method cantidadDeIngrediente(nombre){
		if (ingredientes.any{e => e.nombre() == nombre }){
		return (ingredientes.find{e => e.nombre() == nombre }).cantidad()
		} else {
			return 0
		}

	}
	method cantidadDeIngredienteTorta(nombre){
		if (ingredientesTorta.any{e => e.nombre() == nombre }){
		return (ingredientesTorta.find{e => e.nombre() == nombre }).cantidad()
		} else {
			return 0
		}
	}
	method puedePrepararSuPostreFavorito(){
		return (ingredientes.size().even() and self.cantidadDeIngrediente("azucar") > 0.1 and self.habilidad() > 5)
	}
	method tiempoCoccion(){
		return 50
	}
	method entregaTorta(torta) {
		torta.ingredientes().forEach{e => 
		if (self.cantidadDeIngrediente(e.nombre()) > e.cantidad() and ingredientes.any{l => l.nombre() == e.nombre()}){
			ingredientesTorta.add(new Ingredientes(nombre = e.nombre(), cantidad = e.cantidad()))
			ingredientes.forEach{j => if (j.nombre() == e.nombre()){
				j.cantidad((j.cantidad() - 0.5))
			}}
		} else {
			if (ingredientes.any{l => l.nombre() == e.nombre()}){
			ingredientesTorta.add(new Ingredientes(nombre = e.nombre(), cantidad = self.cantidadDeIngrediente(e.nombre())))
			ingredientes.forEach{j => if (j.nombre() ==  e.nombre()){
				j.cantidad(0)
			}}
		} }
		}
	}
}
object samanta {
	const property ingredientesTorta = []
	method habilidad() {
		return 9
	}
		method puedePrepararSuPostreFavorito(){
		return false
	}
	method tiempoCoccion(){
	return 30
	}
	method ingredientesUtilizados(){
		var c = 0
	 ingredientesTorta.forEach{e =>c = c + e.cantidad() }
	 return c
	}
	method cantidadDeIngredienteTorta(nombre){
		if (ingredientesTorta.any{e => e.nombre() == nombre }){
		return (ingredientesTorta.find{e => e.nombre() == nombre }).cantidad()
		} else {
			return 0
		}
	}

}

object sonia {
	var property ingredientesTorta = []
	var property instrumento = cuchara
	var property ingrediente = new Ingredientes(nombre = "chocolate", cantidad = 1)
	method habilidad() {
		return (1 + ingrediente.cantidad() + instrumento.suerte()).min(10)
	}
	method descartarIngredientes(){
		ingrediente.cantidad(0)
		ingrediente.nombre('')
	}
		method cantidadDeIngrediente(nombre){
		if (ingrediente.nombre() == nombre){
			return ingrediente.cantidad()
		} else {
			return 0
		}
	}
	method ingredientesUtilizados(){
	var c = 0
	 ingredientesTorta.forEach{e =>c = c + e.cantidad() }
	 return c
	}
	method cantidadDeIngredienteTorta(nombre){
		if (ingredientesTorta.any{e => e.nombre() == nombre }){
		return (ingredientesTorta.find{e => e.nombre() == nombre }).cantidad()
		} else {
			return 0
		}
	}
	method puedePrepararSuPostreFavorito(){
		return (self.cantidadDeIngrediente("chocolate") > 0 and instrumento.suerte() > 5 )
	}
	method entregaTorta(torta) {
	 if (torta.ingredientes().any{e => e.nombre() == ingrediente.nombre()}){
	 	ingredientesTorta.add(new Ingredientes(nombre = ingrediente.nombre(), cantidad = torta.cantidadDeIngrediente(ingrediente.nombre()) ))	
	}
}
	method tiempoCoccion(){
	return 50*10/self.habilidad()
	}
}
object tortaWollok{
	var property ingredientes = [
		new Ingredientes(nombre = "chocolate", cantidad = 0.5),
		new Ingredientes(nombre = "harina", cantidad = 0.6),
		new Ingredientes(nombre = "azucar", cantidad = 0.3),
		new Ingredientes(nombre = "manteca", cantidad = 0.1)	
	]
	method cantidadDeIngrediente(nombre){
		if (ingredientes.any{e => e.nombre() == nombre }){
		return (ingredientes.find{e => e.nombre() == nombre }).cantidad()
		} else {
			return 0
		}

	}
	method tiempoRequerido(){
		return 50
	}
	method ingredientesNecesarios(){
	var c = 0
	 ingredientes.forEach{e =>c = c + e.cantidad() }
	 return c
	}
	
}

object cuadernoDeRecetas {
	var property paginas = 3
	method suerte() {
		return paginas
	}
}
object cuchara {
	method suerte() {
		return 2
	}
}
object batidora {
	method suerte(){
		return 10
	}
}
object programa {
	const pasteleros = [sonia, samanta, marcos]
	method masHabilidoso(){
		return pasteleros.max({pastelero => pastelero.habilidad()})	
	} 
	method menosHabilidoso(){
		return pasteleros.min({pastelero => pastelero.habilidad()})	
	} 
	method diferenciaDeHabilidad() {
		const maximo = self.masHabilidoso().habilidad()
		const minimo = self.menosHabilidoso().habilidad()
		return maximo - minimo
	}
}

