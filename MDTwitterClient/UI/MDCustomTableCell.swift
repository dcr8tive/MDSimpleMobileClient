//
//  MDCustomTableCell.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-30.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import Foundation
import UIKit

class MDCustomTableCell: UITableViewCell {
    
    @IBOutlet weak var tweetMessage: UILabel!
    @IBOutlet weak var tweetdetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
