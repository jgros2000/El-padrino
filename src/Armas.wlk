object escopeta{
	method herirA(victima){
		victima.recibirDisparoEscopeta()
	}
}

class Revolver{
	var cantidadBalas
	
	method herirA(victima){
		if (self.tieneBalas())
			self.dispararA(victima)
	}
	
	method dispararA(victima){
		victima.morir()
		cantidadBalas -= 1
	}
	method tieneBalas(){
		return cantidadBalas > 0
	}
}

object cuerdaPianoDeCalidad{
	method herirA(victima){
		victima.morir()
	}
}

object cuerdaPianoDeMalaCalidad{
	method herirA(victima){
		// No hace nada porque es de mala calidad
	}
}