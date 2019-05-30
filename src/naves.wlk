class NaveEspacial {
	var property velocidad = 0
	var direccion = 0
	var property combustible = 1000	
	
	method acelerar(cuanto) { velocidad = (velocidad + cuanto).min(100000) }
	method desacelerar(cuanto) { velocidad -= cuanto.max(0) }
	
	method irHaciaElSol() { direccion = 10 }
	method escaparDelSol() { direccion = -10 }
	method ponerseParaleloAlSol() { direccion = 0 }
	
	method acercarseUnPocoAlSol() { direccion = (direccion+1).min(10) }
	method alejarseUnPocoDelSol() { direccion = (direccion-1).max(-10) }
	
	method cargarCombustible(litros){combustible += litros}
	method descargarCombustible(litros){combustible -= litros}
	
	method escapar()
	method avisar()
	
	method recibirAmenaza(){
		self.escapar()
		self.avisar()
	}
	
	method prepararViaje(){
		self.cargarCombustible(30000)
		self.acelerar(5000)
	}
}

class NaveBaliza inherits NaveEspacial {
	 var property baliza
	 
	 method cambiarColorDeBaliza(color){baliza = color}	 
	 override method prepararViaje(){
	 	super()
	 	self.cambiarColorDeBaliza("verde")
	 	self.ponerseParaleloAlSol()
	 }
	 
	 override method escapar(){self.irHaciaElSol()}
	 override method avisar(){self.cambiarColorDeBaliza("rojo")}
}

class NavePasajeros inherits NaveEspacial {
	 var property pasajeros 
	 var property racionesComidas
	 var property racionesBebidas
	 
	 method cargarComidas(cantidad){racionesComidas += cantidad}
	 method descargarComidas(cantidad){racionesComidas = (racionesComidas-cantidad).max(0)}
	 method cargarBebidas(cantidad){racionesBebidas += cantidad}
	 method descargarBebidas(cantidad){racionesBebidas = (racionesBebidas-cantidad).max(0)}
	 override method prepararViaje(){
	 	super()
	 	self.cargarComidas(4*pasajeros)
	 	self.cargarBebidas(6*pasajeros)
	 	self.acercarseUnPocoAlSol()	 	
	 }
	 
	 override method escapar(){self.acelerar(velocidad)}
	 override method avisar(){self.descargarComidas(pasajeros); self.descargarBebidas(2*pasajeros)}
}

class NaveCombate inherits NaveEspacial {
	var property estaInvisible
	var property misilesDesplegados
	var property mensajesEmitidos = []
	
	override method prepararViaje(){
		super()
		self.ponerseVisible()
		self.replegarMisiles()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en misión")
	}
	
	method ponerseVisible(){estaInvisible = false}
	method ponerseInvisible(){estaInvisible = true}
	
	method desplegarMisiles(){misilesDesplegados = true}
	method replegarMisiles(){misilesDesplegados = false}
	
	method emitirMensaje(mensaje){mensajesEmitidos.add(mensaje)}
	method primerMensajeEmitido(){return mensajesEmitidos.first()}
	method ultimoMensajeEmitido(){return mensajesEmitidos.last()}
	method esEscueta(){return !mensajesEmitidos.any{m => m.length() > 30}}
	method emitioMensaje(mensaje){return mensajesEmitidos.contains(mensaje)}
	
	override method escapar(){self.acercarseUnPocoAlSol(); self.acercarseUnPocoAlSol()}
	override method avisar(){self.emitirMensaje("Amenaza recibida")}	
}

class NaveHospital inherits NavePasajeros {
	var property quirofanosPreparados = true
	
	override method recibirAmenaza(){
		super()
		quirofanosPreparados = true
	}
}

class NaveDeCombateSigilosa inherits NaveCombate {
	override method escapar(){
		super()
		self.desplegarMisiles()
		self.ponerseInvisible()
	}
}