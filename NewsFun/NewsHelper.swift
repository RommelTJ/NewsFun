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
                        
                        switch(classification.prediction.category) {
                        case .business:
                            article.category = .business
                            article.categoryColor = UIColor(red: 0.298, green: 0.882, blue: 0.949, alpha: 1)
                        case .entertainment:
                            article.category = .entertainment
                            article.categoryColor = UIColor(red: 0.129, green: 0.788, blue: 0.588, alpha: 1)
                        case .politics:
                            article.category = .politics
                            article.categoryColor = UIColor(red: 0.929, green: 0.667, blue: 0.169, alpha: 1)
                        case .sports:
                            article.category = .sports
                            article.categoryColor = UIColor(red: 0.996, green: 0.847, blue: 0.325, alpha: 1)
                        case .technology:
                            article.category = .technology
                            article.categoryColor = UIColor(red: 0.298, green: 0.882, blue: 0.949, alpha: 1)
                        }
                        
                        articles.append(article)
                    }
                    returnArticles(articles)
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
    var category: NewsCategory = .business
    var categoryColor = UIColor.red
}

enum NewsCategory: String {
    case business = "💼 Business"
    case entertainment = "🎭 Entertainment"
    case politics = "🗳 Politics"
    case sports = "🏀 Sports"
    case technology = "💻 Technology"
}
