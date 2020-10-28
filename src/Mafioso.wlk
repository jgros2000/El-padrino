class Mafioso {
	var estaVivo = true
	var armas = []
	var estaHerido
	
	method estaDurmiendoConLosPeces() {
		return !estaVivo
	}
	
	method cantidadArmas(){
		return armas.size()
	}
	
	method recibirDisparoEscopeta(){
		if (estaHerido)
			self.morir()
		else
			self.serHerido()
	}
	
	method serHerido(){
		estaHerido = true
	}
	
	method morir(){
		estaVivo = false
	}
	
	method aniadirArma(arma){
		armas.add(arma)
	}
}
