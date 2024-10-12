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
    
    func getNameEpisode(urlEpisode: String, complition: @escaping (Episode) -> Void) {
        let url = URL(string: urlEpisode)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data else { return }
            
            if let episode = try? JSONDecoder().decode(Episode.self, from: data) {
                complition(episode)
                
            } else {
                print("Fail")
            }
        }
        task.resume()
    }
    
    func seasonSeries(name: String) -> String {
        let arrayName = name.filter{$0 != "S" && $0 != "E"}.map{String($0)}
        
        let season = String(Int(arrayName.prefix(2).joined()) ?? 0)
        let episode = String(Int(arrayName.suffix(2).joined()) ?? 0)
        
        return "Episode: \(episode), Season: \(season)"
    }
}
    
