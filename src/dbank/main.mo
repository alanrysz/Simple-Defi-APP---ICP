import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  //currentValue := 100;

  //let constante = 2000000;
  stable var startTime = Time.now();

  Debug.print(debug_show(startTime));
  //Debug.print(debug_show(constante));

  public func topUp(amount: Float){

    currentValue += amount;
      Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    let tempValue: Float = currentValue - amount;
    
    if (tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));  
    }
    else{
    Debug.print("Hay un error, por favor contacte al desarrollador");
    }
  };

  public query func checkBalance(): async Float{
    return currentValue;

  };
  
  public func compound() {

    let currentTime = Time.now();
    let timeElapseedNs = currentTime - startTime;
    let timeElapseedS = timeElapseedNs / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapseedS));
    startTime := currentTime;
  };

}