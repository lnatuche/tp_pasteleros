import pasteleros.*
class Pasteleros {
	var property nombre
	var property puntaje  = 0
}
object jurado {
	var property participantes = [new Pasteleros(nombre = lucas),
						new Pasteleros(nombre = marcos),
						new Pasteleros(nombre = sonia),
						new Pasteleros(nombre = samanta)
		
	]
	method calculoIngredientes(participante,torta){
		return (torta.ingredientesNecesarios()-participante.ingredientesUtilizados())
	}
	method calculoTiempo(participante, torta){
		return(torta.tiempoRequerido() - participante.tiempoCoccion())
	}
	method puntuar(torta){
		participantes.forEach{e => 
			e.puntaje(10-self.calculoIngredientes(e.nombre(),torta)-self.calculoTiempo(e.nombre(), torta))
		}
	}
	method anunciarGanador(){
		return participantes.max{e=>e.puntaje()}
	}
}

// 4.a Los ingredientes son objetos polimorficos porque responden a los mismos mensajes (nombre y cantidad).
//4.b La ventaja del uso de clases es que cuando se tiene varios objetos del mismo tipo que comparten metodos y atributos, se pueden 
// definir estos metodos y atributos en una clase e instanciar los objetos que se requieran.
// No justifica su uso si los objetos no responden exatamente a lo mismo o lo hacen de manera diferente.


