//
//  detalleViewController.swift
//  misRecetas
//
//  Created by Mac on 26/01/17.
//  Copyright © 2017 Heriberto. All rights reserved.
//

import UIKit

class detalleViewController: UIViewController {
    
    @IBOutlet var imagenView: UIImageView!
    
    @IBOutlet var vistaTabla: UITableView!
    
    var receta: Receta!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = receta.name
        
        vistaTabla.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        vistaTabla.tableFooterView = UIView(frame: CGRect.zero)
        vistaTabla.separatorColor = UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        
        self.imagenView.image = self.receta.imagen
        
        self.vistaTabla.estimatedRowHeight = 44.0
        self.vistaTabla.rowHeight = UITableViewAutomaticDimension

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*@IBAction func #imageLiteral(resourceName: "close")(segue: UIStoryboardSegue){
    
    }*/
    
}

    extension detalleViewController: UITableViewDataSource{
        
        func numberOfSections(in tableView: UITableView) -> Int {
            
            return 3
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            switch section {
            case 0:
                
                return 3
                
            case 1:
                
                return self.receta.ingredientes.count
                
            case 2:
                
                return self.receta.pasos.count
                
            default:
                
                return 0
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            
            
            let celdaID = "recetaDetalleCelda"
            
            let celda = tableView.dequeueReusableCell(withIdentifier: celdaID, for: indexPath) as! recetaDetalleViewCell
            
            celda.backgroundColor = UIColor.clear
            
            switch indexPath.section {
            case 0:
                
                switch indexPath.row {
                case 0:
                    
                    celda.claveLabel.text = "Nombre:"
                    celda.valorLabel.text = self.receta.name
                    
                case 1:
                    
                    celda.claveLabel.text = "Tiempo:"
                    celda.valorLabel.text = "\(self.receta.tiempo!) min"
                    
                case 2:
                    
                    celda.claveLabel.text = "Favorito"
                    if self.receta.esFavorita{
                        celda.valorLabel.text = "Si"
                    }else{
                        celda.valorLabel.text = "No"
                    }
                    
                default:
                    
                    break
                }
            case 1:
                
                if indexPath.row == 0 {
                    
                    celda.claveLabel.text = "Ingredientes"
                    
                }else{
                    
                    celda.claveLabel.text = ""
                    
                }
                
                celda.valorLabel.text = self.receta.ingredientes[indexPath.row]
                
            case 2:
                
                if indexPath.row == 0 {
                    
                    celda.claveLabel.text = "Pasos"
                    
                }else{
                    
                    celda.claveLabel.text = ""
                }
                celda.valorLabel.text = self.receta.pasos[indexPath.row]

            default:
                
                break
            }
            
            return celda
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            var tituloSeccion = ""
            
            switch section {
                
            case 1:
                
                tituloSeccion = "Ingredientes"
                
            case 2:
                
                tituloSeccion = "Pasos"
                
            default:
                
                break
            }
            
            return tituloSeccion
        }
     }
    
    extension detalleViewController: UITableViewDelegate{
    
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


