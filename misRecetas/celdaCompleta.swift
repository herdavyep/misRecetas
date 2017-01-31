//
//  celdaCompleta.swift
//  misRecetas
//
//  Created by Mac on 25/01/17.
//  Copyright © 2017 Heriberto. All rights reserved.
//

import UIKit

class celdaCompleta: UITableViewCell {
    
    @IBOutlet var viewImagen: UIImageView!
    
    @IBOutlet var labelNombre: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
