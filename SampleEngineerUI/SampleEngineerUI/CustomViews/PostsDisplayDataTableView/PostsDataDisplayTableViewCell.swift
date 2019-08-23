//
//  PostsDataDisplayTableViewCell.swift
//  SampleEngineerUI
//
//  Created by Venkateswara Reddy N on 23/08/19.
//  Copyright © 2019 ojas. All rights reserved.
//

import UIKit

class PostsDataDisplayTableViewCell: UITableViewCell {

    @IBOutlet weak var postNameLabel: UILabel!
    
    @IBOutlet weak var CreatedAtLabel: UILabel!
    
    @IBOutlet weak var switchToggle: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
