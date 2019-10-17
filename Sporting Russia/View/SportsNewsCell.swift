//
//  SportsNewsCell.swift
//  Sporting Russia
//
//  Created by Eduard Sinyakov on 10/9/19.
//  Copyright © 2019 Eduard Siniakov. All rights reserved.
//

import UIKit

class SportsNewsCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var headerText: UILabel!
    
    var urlStringToShare = String()
    
    
    var descriptionText = String()
    
//    override func awakeFromNib() {
//        imageView.layer.cornerRadius = 20
//        imageView.layer.borderWidth = 5
//        imageView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
//        imageView.clipsToBounds = true
//    }
    
}
