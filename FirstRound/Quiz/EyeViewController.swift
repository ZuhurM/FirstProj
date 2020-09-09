//
//  EyeViewController.swift
//  FirstRound
//
//  Created by Zuhur M on 18.05.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit
import AVFoundation
class EyeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func flashlightOnOffAction(_ sender: Any) {
    let device = AVCaptureDevice.default(for: AVMediaType.video)
           if device!.hasTorch{
               do{
                   try device?.lockForConfiguration()
                   device?.torchMode = device?.torchMode ==  AVCaptureDevice.TorchMode.on ? .off : .on
                   device?.unlockForConfiguration()
               }catch{
                   print(error)
               }
           }
    }
    
}
