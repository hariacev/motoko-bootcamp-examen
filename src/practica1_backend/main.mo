import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor {
  //Persistencia con "stable"
  //stable pone la variable que guarde aún cerrando el programa, la hace estable en memoria
  stable var nameStable : Text = "";
  stable var usuario : [Usuario] = [];

  //Tipos personalizados
  type Usuario = {
    nombre : Text;
    telefono : Text;
    edad : Nat;
  };

  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  public query func sumar(x : Nat, y : Nat) : async Text {
    var suma = x + y;
    return "la suma es: " # Nat.toText(suma) # " fin";
  };

  public query func getNameStable() : async Text {
    return nameStable;
  };

  public query func getUsuario() : async [Usuario] {
    return usuario;
  };

  /*public query func setUsuario(nuevoUsuario : Usuario) : async () {
    //Array.append<Usuario>(usuario, [nuevoUsuario]);
    usuario.append(nuevoUsuario);
  };*/

  //var arreglo : Nat = 0;
  public shared func setUsuario(usuarioNuevo : [Usuario]) : async () {
    usuario := usuarioNuevo;
  };

  public shared func cambiarUsuario() : async () {
    usuario := [
      { nombre = "primero"; edad = 1; telefono = "1233" },
      { nombre = "segundo"; edad = 2; telefono = "ñlakjsdf" },
    ];
  }

};
