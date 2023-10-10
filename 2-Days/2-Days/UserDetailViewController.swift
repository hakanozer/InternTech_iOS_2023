//
//  UserDetailViewController.swift
//  2-Days
//
//  Created by HAKAN ÖZER on 10.10.2023.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    var item: UserModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if item != nil {
            title = item!.name
            
            lblName.text = item?.name
            lblEmail.text = item?.email
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
