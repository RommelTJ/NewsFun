//
//  NewsHelper.swift
//  NewsFun
//
//  Created by Rommel Rico on 5/25/18.
//  Copyright © 2018 Rommel Rico. All rights reserved.
//

import Foundation
import Alamofire
import DocumentClassifier

class NewsHelper {
    
    func getArticles(returnArticles: @escaping  ([Article]) -> Void) {
        Alamofire.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=2ecc5647618b4ff393e171fa34438f44").responseJSON { (response) in
            if let json = response.result.value as? [String: Any] {
                if let jsonArticles = json["articles"] as? [[String: Any]] {
                    var articles = [Article]()
                    for jsonArticle in jsonArticles {
                        guard let title = jsonArticle["title"] as? String,
                            let urlToImage = jsonArticle["urlToImage"] as? String,
                            let url = jsonArticle["url"] as? String,
                            let description = jsonArticle["description"] as? String else { continue }
                        let article = Article()
                        article.title = title
                        article.urlToImage = urlToImage
                        article.url = url
                        article.description = description
                        
                        // CoreML
                        guard let classification = DocumentClassifier().classify(description) else { return }
                        article.category = classification.prediction.category.rawValue
                        
                        articles.append(article)
                    }
                }
            }
        }
    }
    
}

class Article {
    var title = ""
    var urlToImage = ""
    var url = ""
    var description = ""
    var category = ""
}
