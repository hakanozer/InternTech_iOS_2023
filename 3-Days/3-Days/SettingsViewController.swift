//
//  SettingsViewController.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 11.10.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("SettingsViewController Call")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UserDefaults.standard.setValue(1, forKey: "index")
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
