//
//  Receta.swift
//  misRecetas
//
//  Created by Mac on 23/01/17.
//  Copyright © 2017 Heriberto. All rights reserved.
//

import Foundation
import UIKit

class Receta: NSObject {
    var name: String!
    var imagen: UIImage!
    var tiempo: Int!
    var ingredientes: [String]!
    var pasos: [String]!
    var esFavorita: Bool = false
    
    init(name: String, imagen: UIImage, tiempo: Int, ingredientes: [String], pasos: [String] ) {
        self.name = name
        self.imagen = imagen
        self.tiempo = tiempo
        self.ingredientes = ingredientes
        self.pasos = pasos
        
    }
    
}




