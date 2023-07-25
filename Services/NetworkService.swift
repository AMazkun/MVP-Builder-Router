//
//  NetworkService.swift
//  MVP.Router.Assemply.Tests
//
//  Created by admin on 25.07.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping(Result<[Comment]?, Error>) -> Void)
}

class NetworService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error  {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
