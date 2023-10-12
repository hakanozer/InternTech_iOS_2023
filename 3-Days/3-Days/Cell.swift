//
//  ProductTableViewCell.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 12.10.2023.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtCategory: UILabel!
    @IBOutlet weak var txtPrice: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
