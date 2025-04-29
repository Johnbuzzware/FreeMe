//
//  rightTextTableViewCell.swift
//  FasoJobs Freelancer
//
//  Created by Mac on 05/03/2022.
//

import UIKit

class rightTextTableViewCell: UITableViewCell {
    @IBOutlet weak var viewMessage: UIView!
    
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var ivUserImage: UIImageView!
    @IBOutlet weak var lblmessage: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblTimer: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
//        viewMessage.clipsToBounds = true
//        viewMessage.layer.cornerRadius = 10
//        viewMessage.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner,.layerMinXMaxYCorner]
        self.viewMessage.drawThreeCorner(roundTo: .bottomRight)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
