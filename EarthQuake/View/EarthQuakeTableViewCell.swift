//
//  EarthQuakeTableViewCell.swift
//  EarthQuake
//
//  Created by sh3ll on 9.01.2021.
//

import UIKit

class EarthQuakeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelDepth: UILabel!
    @IBOutlet weak var labelViolence: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
