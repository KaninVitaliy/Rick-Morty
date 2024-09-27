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
    
    func getHero(complition: @escaping ([(String,String)]) -> Void) {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let character = try? JSONDecoder().decode(Characters.self, from: data) {
                let countName: Int = character.results?.count ?? 0
                var nameResult: [(String,String)] = []
                
                for count in 0...(countName - 1) {
                    let name = character.results?[count].name ?? ""
                    let image = character.results?[count].image ?? ""
                    let item = (name, image)
                    nameResult.append(item)
                }
                complition(nameResult)
            } else {
                print("Fail")
            }
        }
        task.resume()
    }
}
