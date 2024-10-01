object camion {
    const carga = []
    method cargar(algo) {
      carga.add(algo)
      algo.consecuenciaCarga()
    }
    method descargar(algo) {
      carga.remove(algo)
    }
    method cargarVariasCosas(listaDeCosas) {
      carga.addAll(listaDeCosas)
      carga.forEach({c => c.consecuenciaCarga()})
    }
    method pesoTotal() = 1000 + carga.sum({c => c.peso()})
    method pesosDeLaCarga() = carga.map({c => c.peso()})
    method todoPesoImpar() = self.pesosDeLaCarga().all({e => e.odd()})
    method algoPesa(unValor) = carga.any({c => c.peso() == unValor})
    method cosaConPeligrosidad(nivel) = 
        carga.find({c => c.peligrosidad() == nivel})
    method cosasQueSuperanPeligrosidad(nivel) =
        carga.filter({c => c.peligrosidad() > nivel})
    method cosasMasPeligrosasQue(unaCosa) = 
        carga.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})
    method excedidoDePeso() = self.pesoTotal() > 2500
    method puedeCircularEnRuta(unValor) =
     not self.excedidoDePeso() && self.cosasQueSuperanPeligrosidad(unValor).isEmpty()  
    method tieneAlgunaCosaQuePesa(min,max) = carga.any({c => c.peso().between(min, max)})
    method cosaMasPesada() = carga.max({c => c.peso()})
    method cantidadDeBultosCargados() = carga.sum({c => c.bultos()})
}