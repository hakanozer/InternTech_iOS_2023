//
//  SettingsViewController.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 11.10.2023.
//

import UIKit
import SQLite
import Alamofire
import SCLAlertView
import SDWebImage

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arr:[Product] = []
    @IBOutlet weak var productTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.productTableView.dataSource = self
        self.productTableView.delegate = self
        
        self.productTableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UserDefaults.standard.setValue(1, forKey: "index")
        
        arr = []
        //self.productTableView.reloadData()
        let db = try! Connection(Util.sqlitePath)
        let likes = Table("likes")
        let lid = Expression<Int64>("lid")
        let pid = Expression<Int64>("pid")
        
        for item in try! db.prepare(likes) {
            print(item[lid], item[pid])
            
            let url = "https://dummyjson.com/products/\(item[pid])"
            AF.request(url).responseData { response in
                let status = response.response?.statusCode
                if status == 200 {
                    let data = response.data
                    if (data != nil) {
                        let product = try? JSONDecoder().decode(Product.self, from: data!)
                        self.arr.append(product!)
                        self.productTableView.reloadData()
                    }
                }
            }
        }
        
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
