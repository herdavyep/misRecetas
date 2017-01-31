//
//  recetaDetalleViewCell.swift
//  misRecetas
//
//  Created by Mac on 28/01/17.
//  Copyright © 2017 Heriberto. All rights reserved.
//

import UIKit

class recetaDetalleViewCell: UITableViewCell {
    
    @IBOutlet var claveLabel: UILabel!
    
    @IBOutlet var valorLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
