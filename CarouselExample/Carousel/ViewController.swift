//
//  ViewController.swift
//  Carousel
//
//  Created by Mauricio Esteves on 2020-06-14.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var carouselView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let carouselComponentView = CarouselView(frame: CGRect(x: 0.0, y: 0.0, width: self.carouselView.frame.size.width - 40, height: self.carouselView.frame.size.height), images: [UIImage(named: "Pet3")!, UIImage(named: "Pet3")!, UIImage(named: "Pet3")!, UIImage(named: "Pet4")!])
        carouselView.addSubview(carouselComponentView)
    }

}
