//
//  DocumentTableViewCell.swift
//  DocumentsCoreData
//
//  Created by Clayton Cornett on 9/20/19.
//  Copyright © 2019 Clayton Cornett. All rights reserved.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var filesizeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
