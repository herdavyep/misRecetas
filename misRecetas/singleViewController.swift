//
//  singleViewController.swift
//  misRecetas
//
//  Created by Mac on 24/01/17.
//  Copyright © 2017 Heriberto. All rights reserved.
//

import UIKit

class singleViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var recetas: [Receta] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var receta = Receta(name: "sancocho de gallina",
                            imagen: #imageLiteral(resourceName: "sancocho"),
                            tiempo: 45,
                            ingredientes: ["platanos","papas","gallina                                      criolla","tomates y cebollas"],
                            pasos: ["pelar las papas y los platanos","despresar la gallina","picar la cebolla y los tomates","cosinar por 40 min"])
        recetas.append(receta)
        
        receta = Receta(name: "pizza hawaina",
                        imagen: #imageLiteral(resourceName: "pizza"),
                        tiempo: 20,
                        ingredientes: ["masa","piña","jamon","queso mozarela","salsa"],
                        pasos: ["picar la piña y el jamon","amasar hasta tener una forma redonda y delgada","aplicar la salsa a la masa","colocar encima la piña y el jamon","colocar mucho queso mozarela" ] )
        recetas.append(receta)
        
        receta = Receta(name: "hamburguesa",
                        imagen: #imageLiteral(resourceName: "hamburguesa"),
                        tiempo: 20,
                        ingredientes: ["pan hamburguesa","carne de hamburguesa","tomate y cebolla","salsas","queso mozarela"],
                        pasos: ["sofreir la carne","hacer revanadas de tomate y de cebolla","poner la carne,la cebolla y el tomate encima del pan ","salsas al gusto"])
        recetas.append(receta)
        
        receta = Receta(name: "frijoles con garra",
                        imagen: #imageLiteral(resourceName: "frijoles"), tiempo: 60,
                        ingredientes: ["frijoles","platanos","tosineta de cerdo"],
                        pasos: ["pelar los platanos","picar los platanos y la tosineta","cosinar todo junto en una olla de precion por 45 min"])
        recetas.append(receta)
        
        
        
    }
     override var prefersStatusBarHidden: Bool {
        
        return true
    }


      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}

extension singleViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.recetas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let receta = recetas[indexPath.row]
        let celdaID = "celdaCompleta"
        
        let celda = self.tableView.dequeueReusableCell(withIdentifier: celdaID, for: indexPath) as! celdaCompleta
        
        celda.viewImagen.image = receta.imagen
        celda.labelNombre.text = receta.name
        
        
        return celda
    }
    

}

