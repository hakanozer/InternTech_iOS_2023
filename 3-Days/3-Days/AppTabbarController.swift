//
//  AppTabbarController.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 11.10.2023.
//

import UIKit

class AppTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var index = 0
        if let userIndex = UserDefaults.standard.object(forKey: "index") {
            index = userIndex as! Int
        }
        selectedIndex = index
        addButton()
    }
    
    func addButton() {
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        let tabHeight = tabBar.bounds.height
        
        print(w)
        print(h)
        print(tabHeight)
        
        let view = UIView(frame: CGRect(x: (w - 70), y: (h-(tabHeight + 100)), width: 50, height: 50))
        view.backgroundColor = UIColor.red
        
        // Create Button
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        btn.setTitle("Goto", for: .normal)
        //btn.setImage(.add, for: .normal)
        btn.addTarget(self, action: #selector(fncGoto) , for: .touchUpInside)
        
        view.addSubview(btn)
        self.view.addSubview(view)
    }
    
    @objc func fncGoto() {
        print("fncGoto Call")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        print("AppTabbarController viewDidAppear")
    }
    

}
