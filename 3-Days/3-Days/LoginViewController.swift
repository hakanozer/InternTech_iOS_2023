//
//  LoginViewController.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 11.10.2023.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func fncLogin(_ sender: UIButton) {
        
        let user = username.text!
        let pass = password.text!
        
        let url = "https://dummyjson.com/auth/login"
        let sendObj = ["username": user, "password": pass]
        
        AF.request(url, method: .post, parameters: sendObj).responseData { response in
            let status = response.response?.statusCode
            if status == 200 {
                // success
                let data = response.data
                if (data != nil) {
                    Util.userStore(data: data!)
                    self.performSegue(withIdentifier: "home", sender: nil)
                }
            }else {
                // fail
                print("Username or Password Fail!")
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
