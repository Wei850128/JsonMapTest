//
//  CoffeeTableViewCell.swift
//  JsonTest
//
//  Created by 劉家瑋 on 2020/8/19.
//  Copyright © 2020 劉家瑋. All rights reserved.
//

import UIKit

class CoffeeTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
