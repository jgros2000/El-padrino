import Armas.*
class Mafioso {
	var estaVivo = true
	var armas = []
	var estaHerido
	var rango
	var property lealtad
	
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
	
	method sabeDespachar(){
		rango.sabeDespachar(self)
	}
	
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
	
	method atacarSegunRango(victima){
		rango.atacarA(victima,armas)
	}
	
	method atacarFamilia(familia){
		if (familia.tieneIntegrantesVivos())
			self.atacarSegunRango(familia.integranteMasArmado())
	}
	
	method ascenderPuesto(){
		if (rango.puedeAscender(self))
			self.ascender()
	}
	
	method ascender(){
		rango = rango.ascenso()
	}
	
	method tieneMasDeCincoArmas(){
		return armas.size() > 5
	}
	
	method aumentarLealtad(porcentaje){
		lealtad += (lealtad * porcentaje) / 100
	}
	
	method ajusticiar(){
		//Lo que se supone que deba hacer
	}
	
	method cambiarFamilia(familia){
		familia.aniadirIntegrante(self)
		rango = soldado
		lealtad = 100
	}
}

class Don{
	
	var subordinados = #{}
	
	method puedeAscender(mafioso){
		return false
	}
	
	method sabeDespachar(mafioso){
		return true
	}
	
	method atacarA(victima){
		subordinados.anyOne({subordinado => subordinado.atacarA(victima)})
	}
}

class Subjefe{
	
	var subordinados = #{}
	
	method ascenso(){
		return new Don(subordinados = subordinados)
	}
	
	method puedeAscender(mafioso){
		return false
	}
	
	method sabeDespachar(mafioso){
		return subordinados.any({subordinado => subordinado.sabeDespachar()})
	}
	
	method atacarA(victima,armas){
		armas.anyOne({arma => arma.herirA(victima)})
	}
}

object soldado{
	
	method ascenso(){
		return new Subjefe()
	}
	
	method puedeAscender(mafioso){
		return mafioso.tieneMasDeCincoArmas()
	}
	
	method sabeDespachar(mafioso){
		return mafioso.tieneArmaSutil()
	}
	
	method atacarA(victima,armas){
		armas.first().herirA(victima)
	}
}