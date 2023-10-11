//
//  HomeViewController.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 11.10.2023.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController Call")
        if let user = Util.userData() {
            print(user.firstName)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UserDefaults.standard.setValue(0, forKey: "index")
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
