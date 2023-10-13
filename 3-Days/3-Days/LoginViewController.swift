//
//  LoginViewController.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 11.10.2023.
//

import UIKit
import Alamofire
import SCLAlertView
import UserNotifications

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
                SCLAlertView().showWarning("Error", subTitle: "Username or Password Fail!")
            }
        }
    }
    
    
    let center = UNUserNotificationCenter.current()
    @IBAction func fncAddNotication(_ sender: UIButton) {
        
        // Content
        let content = UNMutableNotificationContent()
        content.title = "Bildirim Başlığı"
        content.subtitle = "Bildirim Alt Başlığı"
        content.body = "Bildirim Ayrıntısı"
        content.sound = UNNotificationSound.default
        
        // Trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        
        let identifier = "userNotification"
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if error != nil {
                print("Notication Error")
            }else {
                print("Notificcation Create Success")
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.center.delegate = self
    }
    

}



extension UIViewController : UNUserNotificationCenterDelegate {
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
}
