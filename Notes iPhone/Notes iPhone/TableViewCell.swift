//
//  TableViewCell.swift
//  Notes iPhone
//
//  Created by Gw on 25/10/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var brandnye: UILabel!
    @IBOutlet weak var versinye: UILabel!
    @IBOutlet weak var iphone: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
