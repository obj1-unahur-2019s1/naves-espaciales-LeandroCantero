class NaveEspacial {
	var velocidad = 0
	var direccion = 0	
	
	method velocidad(cuanto) { velocidad = cuanto }
	method acelerar(cuanto) { velocidad = (velocidad + cuanto).min(100000) }
	method desacelerar(cuanto) { velocidad -= cuanto.max(0) }
	
	method irHaciaElSol() { direccion = 10 }
	method escaparDelSol() { direccion = -10 }
	method ponerseParaleloAlSol() { direccion = 0 }
	
	method acercarseUnPocoAlSol() { direccion = (direccion+1).min(10) }
	method alejarseUnPocoDelSol() { direccion = (direccion-1).max(-10) }
}

class NaveBaliza inherits NaveEspacial {
	 var property baliza
	 
	 method cambiarColorDeBaliza(color){baliza = color}	 
	 method prepararViaje(){}
}

class NavePasajeros inherits NaveEspacial {
	 var property pasajeros 
	 var property racionesComidas
	 var property racionesBebidas
	 
	 method cargarComidas(cantidad){racionesComidas += cantidad}
	 method cargarBebidas(cantidad){racionesBebidas += cantidad}
	 method prepararViaje(){}
}

class NaveCombate inherits NaveEspacial {
	var property estaInvisible
	var property misilesDesplegados
	var mensajes = []
	
	method prepararViaje(){}
	
	method ponerseVisible(){estaInvisible = false}
	method ponerseInvisible(){estaInvisible = true}
	
	method desplegarMisiles(){misilesDesplegados = true}
	method replegarMisiles(){misilesDesplegados = false}
	
	method emitirMensaje(mensaje){
		mensajes.add(mensaje)
		return mensaje
	}
	method mensajesEmitidos(){return mensajes}
	method primerMensajeEmitido(){return mensajes.first()}
	method ultimoMensajeEmitido(){return mensajes.last()}
	method esEscueta(){return !mensajes.any{m => m.length() > 30}}
	method emitioMensaje(mensaje){return mensajes.any{m => m == mensaje}}	
}