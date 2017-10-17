//
//  CustomTableViewCell.swift
//  Todo
//
//  Created by 藤田麻里 on 2017/01/24.
//  Copyright © 2017年 鯖. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate


    @IBOutlet weak var YOTEILabel: UILabel!
    @IBOutlet weak var HIZUKELabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
