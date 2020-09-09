//
//  ViewController.swift
//  FirstRound
//
//  Created by Zuhur M on 29.04.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    @IBOutlet weak var topCustomButton: UIButton!
     var bottomCustomButton = CustomButton()
  
    override func viewDidLoad() {
       super.viewDidLoad()
    }
    
    @IBAction func exitAction(_ sender: Any) {
        do {
                 try Auth.auth().signOut()
             } catch{
                 print(error)
             }
    }
    @IBAction func goToCalls(_ sender: Any) {
    }
    

}

