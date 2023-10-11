//
//  UserModel.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 11.10.2023.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let id: Int
    let username, email, firstName, lastName: String
    let gender: String
    let image: String
    let token: String
}
