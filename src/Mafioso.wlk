class Mafioso {
	var estaVivo = true
	var armas = []
	
	method estaDurmiendoConLosPeces() {
		return !estaVivo
	}
	
	method cantidadArmas(){
		return armas.size()
	}
}
