//
//  APIManager.swift
//  Assessment-3
//
//  Created by ANJALI SHARMA R on 02/07/26.
//

import Foundation


class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    func fetchData(urlString: String, completion: @escaping (Result<[ArticleModel], Error>) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode([ArticleModel].self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
