//
//  weatherCell.swift
//  5gMarktest
//
//  Created by Prasenjit Das on 29/01/20.
//  Copyright © 2020 Prasenjit Das. All rights reserved.
//

import UIKit

class weatherCell: UITableViewCell {
    
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var weatherLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
