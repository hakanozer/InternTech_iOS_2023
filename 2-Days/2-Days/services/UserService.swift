//
//  UserService.swift
//  2-Days
//
//  Created by HAKAN ÖZER on 10.10.2023.
//

import Foundation

class UserService {
    
    func result() -> [UserModel] {
        var arr:[UserModel] = []
        for i in 0...10 {
            let item = UserModel(name: "Name - \(i)", email: "mail\(i)@site.com")
            arr.append(item)
        }
        return arr
    }
    
    
}
