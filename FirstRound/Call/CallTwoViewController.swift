//
//  CallTwoViewController.swift
//  FirstRound
//
//  Created by Zuhur M on 12.05.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit

var nameOne:String{
    get{
      return  UserDefaults.standard.string(forKey: "nameOne_key") ?? ""
        
    } set {
        UserDefaults.standard.set(newValue,forKey: "nameOne_key")
        UserDefaults.standard.synchronize()
    }
}

var nameTwo:String{
    get{
      return  UserDefaults.standard.string(forKey: "nameTwo_key") ?? ""
        
    } set {
        UserDefaults.standard.set(newValue,forKey: "nameTwo_key")
        UserDefaults.standard.synchronize()
    }
}

var nameThree:String{
    get{
      return  UserDefaults.standard.string(forKey: "nameThree_key") ?? ""
        
    } set {
        UserDefaults.standard.set(newValue,forKey: "nameThree_key")
        UserDefaults.standard.synchronize()
    }
}

var numberOne:String{
    get{
      return  UserDefaults.standard.string(forKey: "numberOne_key") ?? ""
        
    } set {
        UserDefaults.standard.set(newValue,forKey: "numberOne_key")
        UserDefaults.standard.synchronize()
    }
}


var numberTwo:String{
    get{
      return  UserDefaults.standard.string(forKey: "numberTwo_key") ?? ""
        
    } set {
        UserDefaults.standard.set(newValue,forKey: "numberTwo_key")
        UserDefaults.standard.synchronize()
    }
}

var numberThree:String{
    get{
      return  UserDefaults.standard.string(forKey: "numberThree_key") ?? ""
        
    } set {
        UserDefaults.standard.set(newValue,forKey: "numberThree_key")
        UserDefaults.standard.synchronize()
    }
}



class CallTwoViewController: UIViewController {

    @IBOutlet weak var nameOneField: UITextField!
    @IBOutlet weak var numberOneField: UITextField!
    @IBOutlet weak var nameTwoField: UITextField!
    @IBOutlet weak var numberTwoField: UITextField!
    @IBOutlet weak var nameThreeField: UITextField!
    @IBOutlet weak var numberThreeField: UITextField!
   
    var completion: ((String,String,String,String,String,String)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOneField.text! = nameOne
        nameTwoField.text! = nameTwo
        nameThreeField.text! = nameThree
        numberOneField.text! = numberOne
        numberTwoField.text! = numberTwo
        numberThreeField.text! = numberThree
               
    }
    
    @IBAction func saveAction(_ sender: Any) {
       
        nameOne = nameOneField.text ?? ""
        nameTwo = nameTwoField.text ?? ""
        nameThree = nameThreeField.text ?? ""
        numberOne = numberOneField.text ?? ""
        numberTwo = numberTwoField.text ?? ""
        numberThree = numberThreeField.text ?? ""
        
        completion?(nameOneField.text!,numberOneField.text!,nameTwoField.text!,
            numberTwoField.text!,nameThreeField.text!,numberThreeField.text!)
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func keyboardHideAction(_ sender: Any) {
        nameOneField.resignFirstResponder()
        nameTwoField.resignFirstResponder()
        nameThreeField.resignFirstResponder()
        numberOneField.resignFirstResponder()
        numberTwoField.resignFirstResponder()
        numberThreeField.resignFirstResponder()
    }
    func AlertCome(){
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert,animated: true,completion: nil)
    }

}
