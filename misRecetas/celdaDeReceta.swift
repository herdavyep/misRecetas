//
//  celdaDeReceta.swift
//  misRecetas
//
//  Created by Mac on 24/01/17.
//  Copyright © 2017 Heriberto. All rights reserved.
//

import UIKit

class celdaDeReceta: UITableViewCell {
    
    @IBOutlet var vistaImagen: UIImageView!
    @IBOutlet var nombreLabel: UILabel!
    @IBOutlet var tiempoLabel: UILabel!
    @IBOutlet var ingredientesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
