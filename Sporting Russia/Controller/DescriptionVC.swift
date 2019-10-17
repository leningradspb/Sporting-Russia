//
//  DescriptionVC.swift
//  Sporting Russia
//
//  Created by Eduard Sinyakov on 10/15/19.
//  Copyright © 2019 Eduard Siniakov. All rights reserved.
//

import UIKit

class DescriptionVC: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var descriptionText = String()
    var urlStringToShared = String()
    
    var descriptionImage = UIImage()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func sharedAction(_ sender: UIBarButtonItem) {
        
        if let urlShared = URL(string: urlStringToShared) {
            
        let shareText = descriptionText
        let sharedImage = descriptionImage
        
        let activityController = UIActivityViewController(activityItems: [shareText, urlShared, sharedImage], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func detailsAction(_ sender: UIButton) {
        if let url = URL(string: urlStringToShared) {
            UIApplication.shared.open(url)
        }
        
   
    }
    override func viewDidLoad() {
     
        setupView()
    }
    
    func setupView() {
        
        imageView.image = descriptionImage
        label.text = descriptionText
        
        
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        imageView.clipsToBounds = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
