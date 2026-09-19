object neo{
    var energia = 100

    method vitalidad() = energia/10

    method esElElegido() = true

    method saltar(){
        energia = energia/2
    }
}

object morfeo{
    var estaCansado = false
    var vitalidad = 8

    method esElElegido() = false
    method vitalidad() = vitalidad

    method saltar(){
        estaCansado = not estaCansado 
        vitalidad = (vitalidad - 1).max(0)
    }
}

object trinity{

    method esElElegido() = false
    method vitalidad() = 0
    method saltar(){}       //se deja vacio
}

object nave{
    const pasajeros = []
    method pasajeros() = pasajeros

    method subirPasajeros(unPasajero){
        pasajeros.add(unPasajero)
    }
    //ejemplo aunque noo se pide aca
    method bajarPasajeros(unPasajero){
        pasajeros.remove(unPasajero)

    }
    //consulta de cantidad de pasajeros CONSULTA
    method cantidadDePasajeros() = pasajeros.size() //size= tamaño de la coleccion

    //pasajero de mayor vitalidad CONSULTA
    method pasajeroDeMayorVitalidad() = pasajeros.max({unPasajero => unPasajero.vitalidad()})

    //que sucede cuando ningun pasajero supera
    //en mas del doble de vitalidad que los demas
    method estaEquilibrado() = 
    self.pasajeroDeMayorVitalidad().vitalidad() <= min*2 
    

    //si el elegido esta en la nave
    method estaElElegido() = pasajeros.any({unPasajero => unPasajero.esElElegido()}) //busca hasta encontrar al elegido


    //nave choca=todos saltan para salvarse y se van
    method chocar(){
        pasajeros.forEach({unPasajero => unPasajero.saltar()})
        pasajeros.clear()
    }

    //nave acelera= saltan todos menos el elegido
    

    method acelerar(){
        pasajeros.filter({unPasajero => not unPasajero.esElElegido()}).forEach({unPasajero => unPasajero.saltar()})
    } //crea una lista con el filter y luego hace que todos los de esa lista salten con el foreach

}