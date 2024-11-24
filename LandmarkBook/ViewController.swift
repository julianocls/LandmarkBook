//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Juliano Santos on 22/11/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImagem = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("Coliseu")
        landmarkNames.append("Dubai")
        landmarkNames.append("Pirâmides")
        landmarkNames.append("Grand Canyon")
        landmarkNames.append("Templo Jerusalém")
        landmarkNames.append("Grande Muralha")
        landmarkNames.append("Foz do Iguaçu")
        
        landmarkImages.append(UIImage(named: "coliseu.jpg")!)
        landmarkImages.append(UIImage(named: "dubaicity.jpg")!)
        landmarkImages.append(UIImage(named: "egyptpyramids.jpg")!)
        landmarkImages.append(UIImage(named: "grandcanyon.jpg")!)
        landmarkImages.append(UIImage(named: "oldtemple.jpg")!)
        landmarkImages.append(UIImage(named: "wallchina.jpg")!)
        landmarkImages.append(UIImage(named: "waterfalls.jpg")!)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        //content.image = landmarkImages[indexPath.row]
        content.text = landmarkNames[indexPath.row]
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImagem = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImagem
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

