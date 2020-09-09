//
//  EmergencyViewController.swift
//  FirstRound
//
//  Created by Zuhur M on 24.05.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit

class EmergencyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func emergencyCallAction(_ sender: Any) {
        let url:URL = URL(string: "TEL://103")!
                              UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    @IBAction func policeCallAction(_ sender: Any) {
        let url:URL = URL(string: "TEL://102")!
                            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    @IBAction func firefighterCallAction(_ sender: Any) {
        let url:URL = URL(string: "TEL://101")!
                            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    @IBAction func mchsCallACtion(_ sender: Any) {
        let url:URL = URL(string: "TEL://+7495400-99-99")!
                                  UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    


}
