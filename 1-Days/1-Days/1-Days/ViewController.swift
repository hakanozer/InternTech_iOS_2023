//
//  ViewController.swift
//  1-Days
//
//  Created by HAKAN ÖZER on 9.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBAction func btnLogin(_ sender: UIButton) {
        let email = txtEmail.text
        let password = txtPassword.text
        if ( email != nil && password != nil ) {
            print(email!, password!)
        }
        print(email ?? "", password ?? "")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Line -1")
        
        // Değişken
        // let, var
        // let : sabit, final, const
        let name = "Ali"
        let age = 30
        let _ : Int = 34
        
        // var
        var surname = "Bilmem"
        surname = "Bilirim"
        let nameSurname = "Name: \(name) Surname: \(surname)"
        print(nameSurname)
        
        // optional type
        let num1: Int? = 20
        var num3: Int?
        num3 = 30
        let num2 = 50
        if ( num1 != nil ) {
            let sum = num1! + num2
            print("Sum: \(sum)")
        }
        // let end = num3 =! nil ? num3 : 25
        print(num3 ?? 25)
        
        
        var i = 0
        i += 1
        
        if(i == 10) {}
        
        let a = 10
        let b = 20
        let c = 30
        
        if ( a == 10 && b == 15 || c == 30 ) {
            print("if true")
        }else {
            print("if false")
        }
        
        
        // Arrays
        var arr1 = ["İstanbul", "İzmir", "Ankara"]
        //var arr2 = Array(arrayLiteral: 5)
        // add element
        arr1.append("Bursa")
        arr1.append("Adana")
        
        // get item
        print(arr1[0])
        
        // remove
        arr1.remove(at: 0)
        
        // loop
        for item in arr1 {
            print(item)
        }
        print(arr1)
        
        
        let arr3: [Any] = ["Ali", 100, true, 11.2, 200, 300]
        for item in arr3 {
            if (item is Int) {
                print("Int: \(item)")
            }
        }
        
        var arrObj: [User] = []
        let user1 = User()
        user1.name = ""
        user1.surname = ""
        arrObj.append(user1)
        for item in arrObj {
            print(item.name)
        }
        
        
        // Dictionray
        //var dic: Dictionary<String, Any> = ["name": "Ali", "surname": "Bilmem", "age": 30, "status": true]
        var dic = ["name": "Ali", "surname": "Bilmem", "age": 30, "status": true] as [String: Any]
        var dic1 = ["name": "Alix", "surname": "Bilmem", "age": 30, "status": true] as [String: Any]
        var dic2 = ["name": "Aliy", "surname": "Bilmem", "age": 30, "status": true] as [String: Any]
        
        // item add
        dic["email"] = "ali@mail.com"
        dic["email"] = "alim@mail.com"
        print(dic["name"]!)
        
        // remove item
        dic.removeValue(forKey: "status")
        
        for (key, val) in dic {
            print("\(key) \(val)")
        }
        print(dic)
        
        
        var arr4: [Dictionary<String, Any>] = []
        arr4.append(dic)
        arr4.append(dic1)
        arr4.append(dic2)
        for parent in arr4 {
            for (key, val) in parent {
                print("\(key) \(val)")
            }
        }
        
        
        let pro1 = Product(title: "TV", price: 100)
        let pro2 = Product(title: "Tablet", price: 300, status: true)
        let pro3 = Product(title: "iPhone", price: 7000)
        var arr5:[Product] = []
        arr5.append(pro1)
        arr5.append(pro2)
        arr5.append(pro3)
        
        for item in arr5 {
            print("\(item.title) \(item.price) \(item.status ?? false)")
        }
        
        let user = User()
        let sm = user.fncCall(num1: 100, num2: 75)
        print(sm)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // View Layer
        print("Line -2")
    }


}

