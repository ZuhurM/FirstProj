//
//  AuthViewController.swift
//  FirstRound
//
//  Created by Zuhur M on 29.04.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit
import Firebase
class AuthViewController: UIViewController {
    
    var signup: Bool = true{
        willSet{
            if newValue{
                titleLabel.text = "Регистрация"
                nameField.isHidden = false
                enterButton.setTitle("У вас уже есть аккаунт?", for: .normal)
            }else{
                titleLabel.text = "Вход"
                nameField.isHidden = true
                enterButton.setTitle("Регистрация", for: .normal)
            }
        }
    
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var voitiButton: UIButton!
    @IBOutlet weak var registrButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
    }
   
    @IBAction func swithLogin(_ sender: UIButton) {
     signup = !signup
        if signup{
            registrButton.isHidden = false
            voitiButton.isHidden = true
        }else{
            registrButton.isHidden = true
            voitiButton.isHidden = false
        }
        
    }

    @IBAction func keyHide(_ sender: Any) {
        nameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
 
    @IBAction func regisAction(_ sender: UIButton) {
        
              let name = nameField.text!
              let email = emailField.text!
              let password = passwordField.text!
              if signup{
                  if(!name.isEmpty && !email.isEmpty && !password.isEmpty){
                      Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                          if let result = result{
                              print(result.user.uid)
                              let ref = Database.database().reference().child("users")
                              ref.child(result.user.uid).updateChildValues(["name" : name, "email" : email ])
                              self.dismiss(animated: true, completion: nil)
                          }
                      }
                  }else{
                      showAlert()
                  }
             
        }
    }
    @IBAction func voitiAction(_ sender: Any) {
        let email = emailField.text!
        let password = passwordField.text!
        if(!email.isEmpty && !password.isEmpty){
                             Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                                 if error == nil {
                                     self.dismiss(animated: true, completion: nil)
                                 }
                             }
                         }else{
                             showAlert()
                         }
    }
    
    
}
extension AuthViewController:UITextFieldDelegate{
    func showAlert(){
           let alert = UIAlertController(title: "Ошибка", message:"Заполните все поля", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert,animated: true, completion: nil)
       }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      
        return true
    }
}
