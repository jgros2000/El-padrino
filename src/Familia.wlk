import Mafioso.*
import Armas.*
class Familia{
	var integrantes
	var don
	
	method integranteMasArmado(){
		return self.integrantesVivos().max({ integrante => integrante.cantidadArmas() })
	}
	
	method integrantesVivos(){
		return integrantes.filter({ integrante => !integrante.estaDurmiendoConLosPeces() })
	}
	
	method repartirRevolver(){
		integrantes.forEach({integrante => integrante.aniadirArma(new Revolver(cantidadBalas = 6))})
	}
	
	method atacarFamilia(familia){
		integrantes.forEach({integrante => integrante.atacarFamilia(familia)})
	}
	
	method tieneIntegrantesVivos(){
		return self.integrantesVivos().size() > 0
	}
	
	method muerteDon(){
		self.ascenderPuestos()
		self.nuevoDon()
		self.aumentarLealtad()
	}
	
	method ascenderPuestos(){
		integrantes.forEach({integrante=>integrante.ascenderPuesto()})
	}
	
	method nuevoDon(){
		don = self.subordinadoMasLeal()
		don.ascender()
	}
	
	method aumentarLealtad(){
		integrantes.forEach({integrante => integrante.aumentarLealtad(10)})
	}
	
	method subordinadoMasLeal(){
		return integrantes.max({integrante=> integrante.lealtad()})
	}
}