//
//  QiuzLastViewController.swift
//  FirstRound
//
//  Created by Zuhur M on 21.05.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit

class QiuzLastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func callAction(_ sender: Any) {
        let url:URL = URL(string: "TEL://103")!
                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    

}
