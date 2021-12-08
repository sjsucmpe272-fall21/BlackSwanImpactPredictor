//
//  APICaller.swift
//  BlackSwanNews
//
//  Created by Puneet Tokhi on 11/22/21.
//

import Foundation


final class APICaller{
    static let shared = APICaller()

    // Storing news API url as constants
    struct Constants {
        static var topHeadlinesURL = URL(string:
            "https://newsapi.org/v2/top-headlines?country=us&apiKey=524e4c9811c8499099f2b7a41a117592&pageSize=9"
        )
        static var searchNewsString =             "https://newsapi.org/v2/everything?sortBy=popularity&pageSize=5&apiKey=524e4c9811c8499099f2b7a41a117592&q="
    }
    
    private init(){}
    
    // function to fetch the top news articles around the globe
    public func getNews(completion: @escaping (Result<[Article], Error>)->Void){
        guard let url = Constants.topHeadlinesURL else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do{
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    // fetches the 
    public func getMarketNews(completion: @escaping (Result<[JSONData], Error>)->Void){
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else{
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do{
            let parsedData = try Data(contentsOf: url)
            let apiData = try JSONDecoder().decode(BlackSwanData.self, from: parsedData)
            completion(.success(apiData.jsonData))
        }

        catch{
            completion(.failure(error))
        }
    }
    
}

// Models
struct APIResponse: Codable{
    let articles: [Article]
}

struct Article: Codable{
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable{
    let name: String
}

struct BlackSwanData: Codable{
    let jsonData: [JSONData]
}

struct JSONData: Codable{
    let title: String
    let subtitle: String
    let urlToImage: String?
}
