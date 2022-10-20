//
//  ViewController.swift
//  InstaClone
//
//  Created by Livia Carvalho Keller on 19/10/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    // o que carrega
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signInClicked(_ sender: UIButton) {
        authUser()
    }
    
    
    @IBAction func signUpClicked(_ sender: UIButton) {
        createUser()
    }
    
    // funcao para criar alerta que recebe um titulo e uma mensagem
    func makeAlert(titleInput: String, messageInput: String) {
        // constante para armazenar o alerta
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        // botao para sair do alerta
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        // colocando a acao do botao no alerta
        alert.addAction(okButton)
        // voltando para a tela
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: - Auth

extension ViewController {
    
    func authUser () {
        
        // caso os atributos email e senha sejam diferentes de nulo
        if emailText.text != "" && passwordText.text != "" {
            // fazendo a autenticacao pelo que o usuario digita nos campos
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                // se o erro for diferente de nulo
                if error != nil {
                    // cria um alerta com o titulo "Error!" e a mensagem do erro
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    // indo para a tela do feed
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            // criando o alerta para o usuario digitar os campos em vazio
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }
    }
}

//MARK: - Create

extension ViewController {
    
    func createUser () {
        
        // caso os atributos email e senha sejam diferentes de nulo
        if emailText.text != "" && passwordText.text != "" {
            // criando o usuario
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }
    }
}
