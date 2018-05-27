//
//  ArticleTableViewController.swift
//  NewsFun
//
//  Created by Rommel Rico on 5/25/18.
//  Copyright © 2018 Rommel Rico. All rights reserved.
//

import UIKit

class ArticleTableViewController: UITableViewController {
    
    var articles: [Article] = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        NewsHelper().getArticles { (articles) in
            self.articles = articles
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCellIdentifier", for: indexPath)
        return cell
    }

}


