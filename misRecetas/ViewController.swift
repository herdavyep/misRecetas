//
//  ViewController.swift
//  misRecetas
//
//  Created by Mac on 23/01/17.
//  Copyright © 2017 Heriberto. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //modelo de datos
     var recetas: [Receta] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //apariencia boton barra de navegacion
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
               
        var receta = Receta(name: "sancocho de gallina",
                            imagen: #imageLiteral(resourceName: "sancocho"),
                            tiempo: 45,
                            ingredientes: ["platanos","papas","gallina      criolla","tomates y cebollas"],
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
    // funcion para ocultar la barra de navegacion cuando se desliza hacia abajo
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // funcion para quitar la barra de estado del dispositivo ej estado bateria etc.
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    //MARK: -UITableViewDataSource
    
    // funcion para agregar el numero de secciones o columnas que tendra la tabla
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    //funcion para agregar el numero de filas que tendra la tabla
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.recetas.count
    }
    
    
    //funcion para mostrar el contenido que queramos en la celda
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let receta = recetas[indexPath.row]
        let celdaID = "celdaDeReceta"
        
        let celda = tableView.dequeueReusableCell(withIdentifier: celdaID, for: indexPath) as! celdaDeReceta
        
        celda.vistaImagen.image = receta.imagen
        celda.nombreLabel.text = receta.name
        celda.tiempoLabel.text = "\(receta.tiempo!) min"
        celda.ingredientesLabel.text = "ingredientes: \(receta.ingredientes.count)"
        
        // si es favorita pone un chulo en la celda
        if receta.esFavorita {
            celda.accessoryType = .checkmark
        }else{
            celda.accessoryType = .none
        }
        
        
       /* funciones para volver las imageView circulares
         celda.vistaImagen.layer.cornerRadius = 33.7
        celda.vistaImagen.clipsToBounds = true*/
        
        return celda
    }
    
    // funcion para eliminar una celda
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.recetas.remove(at: indexPath.row)
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    // funcion para usar las funcionalidades compartir y borrar
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //compartir 
        let accionCompartir = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            let textoCompartir = "Estoy mirando la receta de \(self.recetas[indexPath.row].name!) en la App de recetas de ios 10 "
            let actividadController = UIActivityViewController(activityItems: [textoCompartir,self.recetas[indexPath.row].imagen!], applicationActivities: nil)
            self.present(actividadController, animated: true, completion: nil)
            
        }
        accionCompartir.backgroundColor = UIColor(colorLiteralRed: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        //borrar
        let accionBorrar = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.recetas.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        accionBorrar.backgroundColor = UIColor(colorLiteralRed: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        
        return [accionCompartir,accionBorrar]
    }
    
    //MARK: -UITableViewDelegate
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        let receta = recetas[indexPath.row]
        
        let alertaController = UIAlertController(title: receta.name, message: "Valora este Plato", preferredStyle: .alert)
        let cancelarAccion = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertaController.addAction(cancelarAccion)
        
        var estadoTituloFavorito = "Favorita"
        var estadoEstilo = UIAlertActionStyle.default
        if receta.esFavorita {
            estadoTituloFavorito = "No Favorita"
            estadoEstilo = UIAlertActionStyle.destructive
        }
        
        let accionFavorita = UIAlertAction(title: estadoTituloFavorito, style: estadoEstilo) { (action) in
            let receta = self.recetas[indexPath.row]
            receta.esFavorita = !receta.esFavorita
            self.tableView.reloadData()
            
        }
        alertaController.addAction(accionFavorita)
        
        self.present(alertaController, animated: true, completion: nil)
         */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mostrarDetalleReceta" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                
                let recetaSeleccionada = self.recetas[indexPath.row]
                
                let destinationViewController = segue.destination as! detalleViewController
                
                destinationViewController.receta = recetaSeleccionada
            }
        }
    }
    


}

