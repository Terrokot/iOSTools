//
//  ViewController.swift
//      NewsParsing
//
//  Created by Egor Tereshonok on 10/12/19.
//  Copyright © 2019 Egor Tereshonok. All rights reserved.
//

import UIKit

struct News: Decodable {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://newsapi.org/v2/everything?q=apple&from=2019-10-10&to=2019-10-10&sortBy=popularity&apiKey=e51ebcd2cc674fce8bd3c67c2d390675"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            
            do {
                let news = try JSONDecoder().decode(News.self, from: data)
                print(news)
                
            } catch let jsonErr {
                print ("Error serializing json:", jsonErr)
            }
            
        }.resume()
        
    }
}
