//
//  BloodPointsViewController.swift
//  FirstRound
//
//  Created by Zuhur M on 22.05.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit

class BloodPointsViewController: UIViewController {

    @IBOutlet weak var wristForearmAreaButton: UIButton!
    

 override func viewDidLoad() {
    super.viewDidLoad()
    wristForearmAreaButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6)
    }
    
    

}
