//
//  CustomTableViewCell.swift
//  FirstRound
//
//  Created by Zuhur M on 16.05.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
