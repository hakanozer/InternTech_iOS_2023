//
//  ProductDetailViewController.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 12.10.2023.
//

import UIKit
import ImageSlideshow
import SDWebImage

class ProductDetailViewController: UIViewController, ImageSlideshowDelegate {
    
    var item: Product? = nil
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet var slideshow: ImageSlideshow!
    @IBOutlet weak var txtDetail: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if item != nil {
            txtTitle.text = item!.title
            
            var imageArr:[SDWebImageSource] = []
            for imgPath in item!.images {
                imageArr.append( SDWebImageSource(urlString: imgPath)! )
            }
            slideshow.slideshowInterval = 5.0
            let pageIndicator = UIPageControl()
            pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
            pageIndicator.pageIndicatorTintColor = UIColor.red
            slideshow.pageIndicator = pageIndicator
            slideshow.contentScaleMode = .scaleAspectFit
            slideshow.activityIndicator = DefaultActivityIndicator()
            slideshow.delegate = self
            slideshow.setImageInputs(imageArr)
            
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(ProductDetailViewController.didTap))
            slideshow.addGestureRecognizer(recognizer)
            
            txtDetail.text = item?.description
        }
    }
    
    
    @objc func didTap() {
            let fullScreenController = slideshow.presentFullScreenController(from: self)
            fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
        }


}
