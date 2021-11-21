//
//  ViewController.swift
//  RUTRUX
//
//  Created by reynaldo peralta marquez on 11/18/21.
//  Copyright © 2021 reynaldo peralta marquez. All rights reserved.
//

import UIKit
import FirebaseAuth

class iniciarsesionViewController: UIViewController {

    var HomeViewController: HomeViewController?
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {(user, error) in
            print("Intentando iniciar Sesion")
            if error != nil{
                print("Se presento el siguiente error \(error)")
               let alerta = UIAlertController(title: "Creacion de Usuario", message:
                        "Usuario: \(self.emailTextField.text!) se creo correctamente.",preferredStyle:.alert)
                let crearusuario = UIAlertAction (title: "Crear Usuario", style: .default, handler:{ (UIAlertAction) in self.performSegue (withIdentifier: "crearusuariosegue", sender: nil)})
                let cancelar = UIAlertAction (title: "Cancelar", style: .cancel, handler:{ (UIAlertAction) in
                    print("el registro fue cancelado")})
                alerta.addAction(crearusuario)
                alerta.addAction(cancelar)
                self.present (alerta, animated: true, completion: nil)
            }else{
                print("Inicio Sesion Exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
    }
    
    		
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
              
        // Do any additional setup after loading the view.
    }

    @IBAction func crearusuarioButton(_ sender: Any) {
        
        self.performSegue (withIdentifier: "crearusuariosegue", sender: nil)
    }


}

