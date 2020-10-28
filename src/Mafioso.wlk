import Armas.*
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
	
	method sabeDespachar()
	
	method tieneArmaSutil(){
		return self.tieneCuerdaDePiano() || self.tieneRevolverConUnaBala()
	}
	
	method tieneArma(arma){
		return armas.contains(arma)
	}
	method tieneCuerdaDePiano(){
		return self.tieneArma(cuerdaPianoDeCalidad) || self.tieneArma(cuerdaPianoDeMalaCalidad)
	}
	
	method tieneRevolverConUnaBala(){
		return armas.any({arma => arma.tieneUnaSolaBala()})
	}
}

class Don inherits Mafioso{
	
	var subordinados = #{}
	
	override method sabeDespachar(){
		return true
	}
}

class Subjefe inherits Don{
	
	override method sabeDespachar(){
		return subordinados.any({subordinado => subordinado.sabeDespachar()})
	}
}

class Soldado inherits Mafioso{
	override method sabeDespachar(){
		return self.tieneArmaSutil()
	}
}