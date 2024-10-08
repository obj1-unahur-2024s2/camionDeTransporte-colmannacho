object knightRider {
    method peso() = 500
    method peligrosidad() = 10  
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

}
object paqueteLadrillos {
  var property cantidad = 0
  method peso() = cantidad * 2
  method peligrosidad() = 2
}
object arenaAGranel {
  var property peso = 0
  method peligrosidad() = 1
}
object bateriaAntiaerea {
  var property estaConMisilies = true
  method peso() =  if(estaConMisilies) 300 else 200
  method peligrosidad() = if(estaConMisilies) 100 else 0
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
}
object residuos {
  var property peso = 0
  method peligrosidad() = 200 
}
object embalaje {
  var property cosaEnvuelta = residuos // poner un objeto que conozca los metodos que le pide desp, null no va
  method peso() = cosaEnvuelta.peso()
  method peligrosidad() = cosaEnvuelta.peligrosidad() / 2 
}