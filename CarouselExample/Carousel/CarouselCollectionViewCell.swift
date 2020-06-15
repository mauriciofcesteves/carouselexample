//
//  CarouselCollectionViewCell.swift
//  Carousel
//
//  Created by Mauricio Esteves on 2020-06-14.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func update(image: UIImage) {
        imageView.image = image
    }
}
