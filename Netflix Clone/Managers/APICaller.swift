//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Mehmet Ali Er on 24.12.2023.
//

import Foundation

struct Constants {
    static let API_KEY = "9668cb4089f8ad1683506c26f0d7aa76"
    static let baseUrl = "https://api.themoviedb.org"
}


class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(){
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self,from: data)
                print(results.results[0].original_title)
            } catch  {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
