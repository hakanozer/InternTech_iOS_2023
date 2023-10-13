//
//  Util.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 11.10.2023.
//

import Foundation

class Util {
    
    static let sqlitePath = "/Users/hakan/Documents/InternTech_iOS_2023/3-Days/3-Days/proje.sqlite3"
    
   static func userStore(data: Data) {
        let userModel = try? JSONDecoder().decode(UserModel.self, from: data)
        if let jsonUserModel = try? JSONEncoder().encode(userModel) {
            UserDefaults.standard.setValue(jsonUserModel, forKey: "user")
            UserDefaults.standard.synchronize()
        }
    }
    
    
    static func userData() -> UserModel? {
        if let dtUser = UserDefaults.standard.object(forKey: "user") as? Data {
            UserDefaults.standard.synchronize()
            let userModel = try? JSONDecoder().decode(UserModel.self, from: dtUser)
            return userModel
        }
        return nil
    }
    
    
}
