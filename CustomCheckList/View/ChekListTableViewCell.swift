//
//  ChekListTableViewCell.swift
//  CustomCheckList
//
//  Created by Abdullah Gebreil on 12/1/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import UIKit

class ChekListTableViewCell: UITableViewCell {

    
    //outlets
    @IBOutlet weak var checkItemMark: UILabel!
    @IBOutlet weak var checkitemText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
