//
//  DetailViewController.swift
//  FirstRound
//
//  Created by Zuhur M on 16.05.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
 var diseases: Disease!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var restarauntImage: UIImageView!
    @IBOutlet weak var secondTexView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = diseases.name
        restarauntImage.image = UIImage(named: diseases.name)
        textView.text = diseases.textTwo
        secondTexView.text = diseases.text
        
    }
    


}
