import Mafioso.*
import Armas.*
class Familia{
	var integrantes
	
	method integranteMasArmado(){
		return self.integrantesVivos().max({ integrante => integrante.cantidadArmas() })
	}
	
	method integrantesVivos(){
		return integrantes.filter({ integrante => !integrante.estaDurmiendoConLosPeces() })
	}
	
	method repartirRevolver(){
		integrantes.forEach({integrante => integrante.aniadirArma(new Revolver(cantidadBalas = 6))})
	}
	
}