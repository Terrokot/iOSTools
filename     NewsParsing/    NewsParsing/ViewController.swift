//
//  ViewController.swift
//      NewsParsing
//
//  Created by Egor Tereshonok on 10/12/19.
//  Copyright © 2019 Egor Tereshonok. All rights reserved.
//

import UIKit

struct SearchResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Articles]
}

struct Source: Decodable {
    let id: String?
    let name: String
}
struct Articles: Decodable {
    let source: Source
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

class ViewController: UIViewController {
    
    var searchResponse: SearchResponse? = nil
    let urlString = "https://newsapi.org/v2/everything?q=apple&from=2019-10-10&to=2019-10-10&sortBy=popularity&apiKey=e51ebcd2cc674fce8bd3c67c2d390675"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        request(urlString: urlString) { (searchResponse, error) in
            searchResponse?.articles.map({ (article) in
                print(article.author)
                print("HUI")
            })
        }
    }
    
    func request(urlString:String, completion: @escaping (SearchResponse?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(nil, error)
                    return
                }
                guard let data = data else { return }
                do {
                    let news = try JSONDecoder().decode(SearchResponse.self, from: data)
                    completion(news, nil)
                } catch let jsonError {
                    print("Error", jsonError)
                    completion(nil, jsonError)
                }
            }
        }.resume()
        
    }
}
