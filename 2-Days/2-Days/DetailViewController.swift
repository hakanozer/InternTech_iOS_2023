//
//  DetailViewController.swift
//  2-Days
//
//  Created by HAKAN ÖZER on 10.10.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var lblData: UILabel!
    var pullData = ""
    
    @IBAction func btnClose(_ sender: UIButton) {
        // Bu class yapısını öldür
        self.dismiss(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(pullData)
        lblData.text = pullData
    }

   

}
