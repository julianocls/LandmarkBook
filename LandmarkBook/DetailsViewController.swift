//
//  DetailsViewController.swift
//  LandmarkBook
//
//  Created by Juliano Santos on 23/11/24.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var landmarkImage: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkImage.image = selectedLandmarkImage
        landmarkLabel.text = selectedLandmarkName
    }

}
