//
//  usersModel.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 28/07/24.
//

import Foundation

// MARK: - Users Array
struct UsersArray: Codable {
    let users: [User]
}

// MARK: - User
struct User: Codable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender, email, phone, username: String
    let password, birthDate, image, bloodGroup: String
    let height, weight: Double
}
