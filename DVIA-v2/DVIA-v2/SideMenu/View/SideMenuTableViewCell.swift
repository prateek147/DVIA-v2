//
//  SideMenuTableViewCell.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 22/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import UIKit

struct MenuCellModel {
    var item: MenuCellItem
}

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ item: Any?) {
        guard let cellModel = item as? MenuCellModel else { return }
        title.text = cellModel.item.title
    }
}
