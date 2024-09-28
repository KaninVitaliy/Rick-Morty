//
//  ApiManager.swift
//  Rick&Morty
//
//  Created by Виталий Канин on 27.09.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let urlString = "https://rickandmortyapi.com/api/character"
    
    func getHero(complition: @escaping (Characters) -> Void) {
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            
            if let character = try? JSONDecoder().decode(Characters.self, from: data) {
                complition(character)
            } else {
                print("Fail")
            }
        }
        task.resume()
    }
}
