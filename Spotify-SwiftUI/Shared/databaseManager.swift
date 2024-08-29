//
//  databaseManager.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 27/07/24.
//

import Foundation

import Foundation

struct databaseManager {
    
    func getProducts() async throws -> [Product]{
        guard let url = URL(string: "https://dummyjson.com/products") else {throw URLError(.badURL)}
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let products = try JSONDecoder().decode(ProductsArray.self, from: data)
            return products.products
        }catch{
            print("catched error",error.localizedDescription)
            return []
        }
      
    }
    
    func getUsers() async throws -> [User]{
        guard let url = URL(string: "https://dummyjson.com/users") else {throw URLError(.badURL)}
        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(UsersArray.self, from: data)
        return users.users
    }
    
}
