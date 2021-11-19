//
//  CatCell.swift
//  Cat App
//
//  Created by Leonardo Albergaria on 18/11/21.
//

import UIKit

class CatCell: UITableViewCell {

    @IBOutlet weak var catCell: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        catCell.layer.cornerRadius = catCell.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
