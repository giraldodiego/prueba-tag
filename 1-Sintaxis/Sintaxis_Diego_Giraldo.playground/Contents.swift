import UIKit
import XCPlayground
/*:
# Trabajo Final
Hemos implementado un Carro en el Playground, deseamos que lo muevas por la pista y hagas por lo menos una vuelta, este carro solo gira a la izquierda y va hacia el frente, piensa bien cómo vas a dar una vuelta a la pista.

Después de dar una vuelta con el carro, queremos que implementes, tu versión de este (haz uso de la herencia para poderlo animar). Tu versión debe contener los métodos que permitan encender el carro, apagar el carro, conocer si este está encendido o apagado. Teniendo esto ya implementado, da otra vuelta a la pista (¡Recuerda encender y apagar tu carro!)

Con la misma clase que creaste en el paso anterior. Implementa un contador de gasolina en el coche, así como un método que permita echar gasolina y saber cuanta gasolina tiene el vehículo, este debe ser en porcentaje siendo 0.0 tanque vacío. 0.5 medio tanque y 1.0 tanque lleno.

Luego queremos que hagas que tu carro de 5 vueltas, ¡ten en cuenta no repitas código!.

Para finalizar el proyecto, queremos que tu carro de tantas vueltas como la gasolina lo permite… Haz que este vehículo recorra la pista hasta que se quede sin gasolina, cuando esto pase, llénalo de nuevo y da otra vuelta. en este punto habrás terminado con el ejercicio final. ¡Felicidades!.

## Para tener en cuenta:

Actualmente tenemos 2 objetos creados que puedes usar:
### ```Car```:
Es tu carro rojo, el carro que debes poner a correr por toda la pista, este cuenta con un inicializador especial y requiere de ```Circuit```.
Ademas cuenta con dos métodos los cuales son:
 + ```moveLeft()```: Que gira el carro hacia la izquierda.
 + ```moveStraight()```: Mueve una casilla el carro hacia su frente, recuerda que nosotros definimos una casilla como una de las rayas blancas pintadas en la pista.

### ```Circuit```:
Esta es la pista como tal, ella ya se encuentra pre-declarada en tu codigo como un opcional, implementa su construcción que no requiere de parámetros especiales y pasala al inicializador de ```Car```.

## Como ejecutar:
El proyecto por defecto está configurado para no auto-ejecutar el código, en la parte inferior izquierda veras el boton de play para que lo pongas a correr, además ten en cuenta que deberás abrir en xcode la vista lateral  (Assistant Editor) donde se despliega la animación.

## Para entregar:
Para entregar la solución del problema implementa funciones con el código de cada uno de los puntos que pedimos hacer, de este modo solo llamas a la función del punto en que estas trabajando en el momento. Asi evitas esperar todas las animaciones anteriores para ver tu resultado.
*/

var circuit:Circuit?

circuit = Circuit()
let car = Car(circuit: circuit!)

func moveRight(){
    for _ in 0...2{
        car.moveLeft()
    }
}

//Primera vuelta con car
func carRide() {
    for (var i = 0; i<32; i++){
        if(i==3||i==7||i==15||i==22||i==27){
            car.moveLeft()
        }
        else if(i==31){
            moveRight()
        } else {car.moveStraight()}
    }
}

//Clase propia con funciones requeridas en pasos uno y dos
class 🚗 : Car{
    var engineState:Bool=false
    var gasLevel:Double=1.0
    init(){
        super.init(circuit: circuit!)
    }
    func turnOn(){
        if engineState{
            print("It was already on")
        }
        else{
            engineState=true
            print("Now it's on!")
        }
    }
    func turnOff(){
        if !engineState{
            print("It was already off")
        }
        else{
            engineState=false
            print("Now it's off :(")
        }
    }
    func gasCount() -> String{
        
        switch(gasLevel) {
        case 1.0:
            return "Full"
        case 0.5:
            return "Half"
        case 0.0:
            return "Empty"
        default:
            return "Idk"
        }
    }
    func fill(){
        if(gasLevel < 1.0){
            gasLevel=1.0
            print("Full gas")
        }
    }
    func moveRight(){
        for _ in 0...2{
            self.moveLeft()
        }
    }
    func carRide(laps:Int) {
        if(engineState){
        for _ in 1...laps{
        for (var i = 0; i<32; i++){
            if(i==3||i==7||i==15||i==22||i==27){
                self.moveLeft()
            }
            else if(i==31){
                moveRight()
            } else {self.moveStraight()}
        }
        }
        }else{print("Car off")}
    }
    func carRideWithGas() {
        if(engineState){
        while(self.gasCount() != "Empty"){
        for (var i = 0; i<32; i++){
            if(i==3||i==7||i==15||i==22||i==27){
                self.moveLeft()
            }
            else if(i==31){
                moveRight()
            } else {self.moveStraight()}
            gasLevel-=0.03125
        }
            }}else{print("Car off")}
    }
    

}
let myCar=🚗()

//Primera parte
carRide()

//Primer paso
myCar.turnOn()
myCar.carRide(1)
myCar.turnOff()

//Segundo paso
myCar.turnOn()
myCar.carRide(5)
myCar.turnOff()

//Tercer paso
myCar.turnOn()
myCar.carRideWithGas()
myCar.fill()
myCar.carRideWithGas()
myCar.turnOff()

/*:
### El siguiente codigo es parte de la parte visual
Favor no manipular el codigo ```XCPShowView``` este es el encargado de mostrar los graficos en la pantalla. Cualquier cambio en este podria dañar tu proyecto.
*/
if let c = circuit {
    XCPShowView("Container View", view: c)
}




