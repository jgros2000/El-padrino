class Traicion{
	var traidor
	var objetivos
	var fecha
	var familiaATraicionar
	var nuevaFamilia
	
	method complicarSituacion(nuevaFecha,nuevoObjetivo){
		fecha = nuevaFecha
		objetivos.add(nuevoObjetivo)
	}
	
	method intentarTraicion(){
		self.ejecutarTraicion()
		familiaATraicionar.aniadirTraicion()
	}
	
	method ejecutarTraicion(){
		if (self.traicionExitosa()){
			objetivos.forEach({objetivo => traidor.atacarA(objetivo)})
			traidor.cambiarFamilia(nuevaFamilia)
			familiaATraicionar.quitarIntegrante(traidor)
		}
		else
			traidor.ajusticiar()
	}
	
	method traicionExitosa(){
		return familiaATraicionar.lealtadPromedio() <= traidor.lealtad()*2
	}
	
}