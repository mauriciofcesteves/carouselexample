//
//  CarouselView.swift
//  Carousel
//
//  Created by Mauricio Esteves on 2020-06-14.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class CarouselView: UIView {
    
    public static var pageIndicatorTintColor = UIColor(red: 10/255, green: 73/255, blue: 144/255, alpha: 0.3)
    public static var currentPageIndicatorTintColor = UIColor(red: 10/255, green: 73/255, blue: 144/255, alpha: 1)
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var carouselPageControl: UIPageControl!
    
    private var images: [UIImage]?
    
    init(frame: CGRect, images: [UIImage]) {
        self.images = images
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CarouselView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        carouselPageControl.numberOfPages = images?.count ?? 0
        carouselPageControl.size(forNumberOfPages: images?.count ?? 0)
        carouselCollectionView.register(UINib(nibName: "CarouselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarouselCollectionViewCell")
        carouselPageControl.currentPage = 0
        carouselPageControl.hidesForSinglePage = true
        carouselPageControl.pageIndicatorTintColor = CarouselView.pageIndicatorTintColor
        carouselPageControl.currentPageIndicatorTintColor = CarouselView.currentPageIndicatorTintColor
    }
}

extension CarouselView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width, height: self.frame.size.height)
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        carouselPageControl.currentPage = Int(pageNumber)
    }
}

extension CarouselView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let images = images else {
            return UICollectionViewCell()
        }
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell", for: indexPath) as? CarouselCollectionViewCell {
            cell.update(image: images[indexPath.item])
            return cell
        }
        
        return UICollectionViewCell()
    }
}
