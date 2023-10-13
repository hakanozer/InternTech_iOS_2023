//
//  ProductDetailViewController.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 12.10.2023.
//

import UIKit
import ImageSlideshow
import SDWebImage
import SQLite

class ProductDetailViewController: UIViewController, ImageSlideshowDelegate {
    
    var item: Product? = nil
    
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet var slideshow: ImageSlideshow!
    @IBOutlet weak var txtDetail: UITextView!
    
    @IBOutlet weak var btnLike: UIButton!
    @IBAction func fncLike(_ sender: UIButton) {
        if item != nil {
            let db = try! Connection(Util.sqlitePath)
            let likes = Table("likes")
            let pid = Expression<Int64>("pid")
            let likesSingleRow = likes.filter(pid == Int64(item!.id))
            //if likesSingleRow.select() {
                let result = likes.insert(pid <- Int64(item!.id))
                let rowid = try! db.run(result)
                if rowid > 0 {
                    print("success \(rowid)")
                //}
            }else {
                print("daha önce kayıtlı")
            }
        }
    }
    
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
