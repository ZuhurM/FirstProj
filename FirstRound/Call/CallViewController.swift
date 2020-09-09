//
//  CallViewController.swift
//  FirstRound
//
//  Created by Zuhur M on 09.05.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit
import MessageUI
class CallViewController: UIViewController {

    private let toSelect = "segue"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var thirdNameLabel: UILabel!
    @IBOutlet weak var callOneButton: UIButton!
    @IBOutlet weak var callTwoButton: UIButton!
    @IBOutlet weak var callThreeAction: UIButton!
    var phoneNumber = ""
    var phoneNumberTwo = ""
    var phoneNumberThree = ""
    override func viewDidLoad() {
        super.viewDidLoad()
      
        }

    
    @IBAction func firstCallAction(_ sender: Any) {
        if phoneNumber != ""{
            let url:URL = URL(string: "TEL://\(self.phoneNumber)")!
                 UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            print("Calling")
        }
        else if phoneNumber == "" {
            ShowAlert()
        }
    }
    
    @IBAction func secondCallAction(_ sender: Any) {
        if phoneNumberTwo != ""{
                  let url:URL = URL(string: "TEL://\(self.phoneNumberTwo)")!
                       UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                  print("Calling")
              }
              else if phoneNumberTwo == "" {
                  ShowAlert()
              }
    }
    
    @IBAction func thirdCallAction(_ sender: Any) {
        if phoneNumberThree != ""{
                  let url:URL = URL(string: "TEL://\(self.phoneNumberThree)")!
                       UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                  print("Calling")
              }
              else if phoneNumberThree == ""{
               ShowAlert()
              }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == toSelect{
            if let selectVC = segue.destination as? CallTwoViewController{
                 selectVC.completion = {[weak self] nameUne,numberUne,nameToo,numberToo,nameTree,numberTree in
                     guard let self = self else {return}
                    self.callOneButton.isHidden = false
                    self.firstNameLabel.isHidden = false
                    self.firstNameLabel.text = nameUne
                    self.secondNameLabel.text = nameToo
                    self.thirdNameLabel.text = nameTree
                    self.secondNameLabel.isHidden = false
                    self.thirdNameLabel.isHidden = false
                    self.phoneNumber = numberUne
                    self.phoneNumberTwo = numberToo
                    self.phoneNumberThree = numberTree
                    
                     
                 }
             }
         }
     }
    func ShowAlert(){
           let alert = UIAlertController(title: "Отсутсвие номера", message: "Добавьте номер и сохраните его", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert,animated: true,completion: nil)
       }
    @IBAction func goToEmergencyAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(identifier: "EmergencyViewController") as! EmergencyViewController
        self.present(newVC, animated: true, completion: nil)

    }
    
}
  
    
