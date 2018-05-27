//
//  NewsHelper.swift
//  NewsFun
//
//  Created by Rommel Rico on 5/25/18.
//  Copyright © 2018 Rommel Rico. All rights reserved.
//

import Foundation
import Alamofire

class NewsHelper {
    
    func getArticles() {
        Alamofire.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=2ecc5647618b4ff393e171fa34438f44").responseJSON { (response) in
            print(response)
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
