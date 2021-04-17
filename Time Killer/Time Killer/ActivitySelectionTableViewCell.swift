//
//  ActivitySelectionTableViewCell.swift
//  Time Killer
//
//  Created by John Smith V on 4/16/21.
//

import UIKit

class ActivitySelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var activityImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
