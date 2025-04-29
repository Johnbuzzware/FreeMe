//
//  leftTextTableViewCell.swift
//  FasoJobs Freelancer
//
//  Created by Mac on 05/03/2022.
//

import UIKit

class leftTextTableViewCell: UITableViewCell {

    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var viewMessage: UIView!
    
    @IBOutlet weak var lblmessage: UILabel!
    
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var ivUserImage: UIImageView!
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblTimer: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.viewMessage.drawThreeCorner(roundTo: .bottomLeft)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
