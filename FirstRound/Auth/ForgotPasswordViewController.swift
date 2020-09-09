//
//  ForgotPasswordViewController.swift
//  FirstRound
//
//  Created by Zuhur M on 01.05.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit
import FirebaseAuth
class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func forgotpasswodAction(_ sender: UIButton) {
        let email = emailField.text!
        if (!email.isEmpty){
        Auth.auth().sendPasswordReset(withEmail: email) { (error ) in
            if error == nil{ self.dismiss(animated: true, completion: nil)}
        }
    }
}
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
