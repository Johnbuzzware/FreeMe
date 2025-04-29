//
//  ProfileTopTableViewCell.swift
//  FreeMe
//
//  Created by Asad's Mac on 17/02/2025.
//

import UIKit

class ProfileTopTableViewCell: UITableViewCell {

    @IBOutlet weak var btnswitch: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
class ProfileCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var llbname: UILabel!
    @IBOutlet weak var btnarrow: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
