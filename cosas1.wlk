object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bultos() = 1
    method consecuenciaCarga() {}
}
object bumblebee {
  var modoAuto = true
  method peso() = 800
  method peligrosidad() = if(modoAuto) 15 else 30
  method transformarseEnAuto() {
    modoAuto = true
  }
  method transformaseEnRobot() {
    modoAuto = false
  }
  method estaEnModoAuto() = modoAuto 
  method bultos() = 2
  method consecuenciaCarga() {
    self.transformaseEnRobot()
  }
}
object paqueteLadrillos {
  var property cantidad = 0
  method peso() = cantidad * 2
  method peligrosidad() = 2
  method bultos() = 
    if(cantidad <= 100) 1 else if(cantidad.between(101,300)) 2 else 3
  method consecuenciaCarga() {
    cantidad = cantidad + 12
  }
}
object arenaAGranel {
  var property peso = 0
  method peligrosidad() = 1
  method bultos() = 1
  method consecuenciaCarga() {
    peso = 0.max(peso - 10)
  }
}
object bateriaAntiaerea {
  var property estaConMisilies = true
  method peso() =  if(estaConMisilies) 300 else 200
  method peligrosidad() = if(estaConMisilies) 100 else 0
  method bultos() = if(self.estaConMisilies()) 2 else 1
  method consecuenciaCarga() {
    self.estaConMisilies(true)
  }
}
object contenedorPortuario {
  const cosasDentro = []
  method agregarCosa(cosa) {
    cosasDentro.add(cosa)
  }
  method sacarCosa(cosa) {
    cosasDentro.remove(cosa)
  }
  method agregarVariasCosas(listaDeCosas) {
    cosasDentro.addAll(listaDeCosas)
  }
  method peso() =  100 + cosasDentro.sum({c => c.peso()})
  method peligrosidad() =
   if(cosasDentro.isEmpty()) 0 else cosasDentro.max({c => c.peligrosidad()}).peligrosidad()
  method bultos() = 1 + cosasDentro.sum({c => c.bultos()})
  method consecuenciaCarga() {
    cosasDentro.forEach({c => c.concecuenciaCarga()})
  }
}
object residuos {
  var property peso = 0
  method peligrosidad() = 200 
  method bultos() = 1
  method consecuenciaCarga() {
    peso = peso + 15
  }
}
object embalaje {
  var property cosaEnvuelta = residuos // poner un objeto que conozca los metodos que le pide desp, null no va
  method peso() = cosaEnvuelta.peso()
  method peligrosidad() = cosaEnvuelta.peligrosidad() / 2
  method bultos() = 2
  method consecuenciaCarga() {}
}