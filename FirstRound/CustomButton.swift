//
//  CustomButton.swift
//  FirstRound
//
//  Created by Zuhur M on 20.05.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    func setupButton() {
        setShadow()
        setTitleColor(.black, for: .normal)
        
        titleLabel?.font     = UIFont(name: "AvenirNext-DemiBold", size: 18)
        layer.cornerRadius   = 13
        layer.borderWidth    = 1.0
        layer.borderColor    = UIColor.darkGray.cgColor
    }
    
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 13.0)
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    

}
