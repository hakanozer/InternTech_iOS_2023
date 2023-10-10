//
//  ViewController.swift
//  2-Days
//
//  Created by HAKAN ÖZER on 10.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtData: UITextField!
    @IBAction func btnGotoDetail(_ sender: UIButton) {
        let data = txtData.text
        // Store Data
        UserDefaults.standard.set(data, forKey: "keyData")
        UserDefaults.standard.synchronize()
        print( NSHomeDirectory() )
        self.performSegue(withIdentifier: "detail", sender: data!)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let data = sender as! String
            let vc = segue.destination as! DetailViewController
            vc.pullData = data
        }
    }
    
    
    @IBAction func btnGotoUser(_ sender: UIButton) {
        performSegue(withIdentifier: "users", sender: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let dt = UserDefaults.standard.string(forKey: "keyData") {
            txtData.text = dt
        }
        // UserDefaults.standard.removeObject(forKey: "keyData")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let dt = UserDefaults.standard.string(forKey: "keyData") {
            if dt == "ali" {
                // performSegue(withIdentifier: "users", sender: nil)
            }
        }
    }


}

