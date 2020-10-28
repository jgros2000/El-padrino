import Mafioso.*
class Familia{
	var integrantes
	
	method integranteMasArmado(){
		return self.integrantesVivos().max({ integrante => integrante.cantidadArmas() })
	}
	
	method integrantesVivos(){
		return integrantes.filter({ integrante => !integrante.estaDurmiendoConLosPeces() })
	}
}