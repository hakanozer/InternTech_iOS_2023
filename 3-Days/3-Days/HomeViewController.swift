//
//  HomeViewController.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 11.10.2023.
//

import UIKit
import Alamofire
import SCLAlertView
import SDWebImage

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arr:[Product] = []
    @IBOutlet weak var productTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.productTableView.dataSource = self
        self.productTableView.delegate = self
        
        self.productTableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        if let user = Util.userData() {
            print(user.firstName)
        }
        
        let url = "https://dummyjson.com/products"
        AF.request(url).responseData { response in
            let status = response.response?.statusCode
            if status == 200 {
                let data = response.data
                if data != nil {
                    let productsModel = try? JSONDecoder().decode(ProductsModel.self, from: data!)
                    if productsModel != nil {
                        self.arr = productsModel!.products
                        self.productTableView.reloadData()
                    }
                }
            }else {
                SCLAlertView().showError("Fail", subTitle: "Server Error!")
            }
        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        UserDefaults.standard.setValue(0, forKey: "index")
    }
    

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
         
        let product = arr[indexPath.row]
        cell.txtTitle.text = product.title
        cell.txtCategory.text = product.category
        cell.txtPrice.text = "\(product.price)₺"
         
         /*
         let imgUrl = product.thumbnail
         let uri = URL(string: imgUrl)
         let data = try? Data(contentsOf: uri!)
         cell.img.image = UIImage(data: data!)
         */
         
         cell.img.sd_setImage(with: URL(string: product.thumbnail) )
         
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = arr[indexPath.row]
        self.performSegue(withIdentifier: "productDetail", sender: item)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productDetail" {
            let vc = segue.destination as! ProductDetailViewController
            let obj = sender as! Product
            vc.item = obj
        }
    }
    
    
    

}
