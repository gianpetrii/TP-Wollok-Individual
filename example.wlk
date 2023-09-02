/** First Wollok example */
object donPonciano {
	var cuentaBanco = 5000
	method restarCosto (calculoCosto) {
		cuentaBanco = cuentaBanco - calculoCosto 
	}
	method costoFertilizarCampo () {
		return campoDonPonciano.costoFertilizar()
	}
	method CosecharVenderResembrar (cultivoNuevo) {
		campoDonPonciano.CosecharVenderResembrar(cultivoNuevo)
	}
	method cobrarVenta (calculoVenta) {
		cuentaBanco = cuentaBanco + calculoVenta
	}
}

object campoDonPonciano {
	const hectareas = 15
	var hectareasSembradas = 10
	var cultivo = trigo
	method costoFertilizar () {
		return fertilizante.costoAlAplicar(hectareasSembradas)
	}
	method fertilizarCampo () {
		cultivo.fertilizacion()
		donPonciano.restarCosto(self.costoFertilizar())
	}

	method resembrado (cultivoNuevo) {
		cultivo = cultivoNuevo
		donPonciano.restarCosto(cultivo.costoHectarea(hectareasSembradas))
	}
	method ampliacion () {
		hectareasSembradas = hectareas
	}
	method CosecharVenderResembrar(cultivoNuevo) {
		
		donPonciano.cobrarVenta(self.precioDeVenta())
		self.resembrado(cultivoNuevo)
	}
	method precioDeVenta () {
		return cultivo.precioDeVentaUnaHectarea() * hectareasSembradas
	}
	
}

object fertilizante {
	const costoCadaHectarea = 10
	method costoAlAplicar (hectareas) {
		return hectareas * costoCadaHectarea
	}
}

object trigo {
	const costo = 500
	var rendimientoQuintales = 10
	const precio = 1000
	method costoHectarea (hectarea) {
		return hectarea * costo
	}
	method fertilizacion () {
		rendimientoQuintales = rendimientoQuintales + 2
	}
	method precioDeVentaUnaHectarea () {
		return precio * rendimientoQuintales
	}
}

object soja {
	var costo = self.devolverPrecio()/2
	var rendimientoQuintales = 20
	var fueFertilizado = false
	const precio = 1000
	method costoHectarea (hectarea) {
		return costo * hectarea
	}
	method fertilizacion () {
		if (!fueFertilizado) {
			rendimientoQuintales = 40
			fueFertilizado = true
		} else {
			rendimientoQuintales = 20
			fueFertilizado = false
		}
	}
	method precioDeVentaUnaHectarea () {
		return mercadoChicago.precio() * dolarSoja.cotizacion() * 0.65
	}
	method informeMercadoInter (costoNuevo) {
		costo = costoNuevo
	}
	method devolverPrecio() {
		return precio
	}
}

object mercadoChicago {
	const precioXquintal = 100
	method precio() {
		return precioXquintal
	}
}
object dolarSoja {
	const cotizacionSoja = 100
	method cotizacion() {
		return cotizacionSoja
	}
}

object maiz {
	const costo = 500
	const rendimientoQuintales = 15
	const precio = soja.devolverPrecio()
	method costoHectarea (hectarea) {
		if (hectarea * costo >= 5000) {
			return 5000
		} else {
			return hectarea * costo
		}
	}
	method fertilizacion () {
		
	}
	method precioDeVentaUnaHectarea () {
		return precio * rendimientoQuintales
	}
}

object cereal {
    const costo = self.devolverRendimiento() *  10
    var rendimientoQuintales = 12
    const precio = costo * 1.21

	method devolverRendimiento () {
		return rendimientoQuintales
	}

    method costoHectarea(hectarea) {
        return costo * hectarea
    }

    method fertilizacion() {
            rendimientoQuintales += 3
    }

    method precioDeVentaUnaHectarea() {
        return rendimientoQuintales * precio
    }
}