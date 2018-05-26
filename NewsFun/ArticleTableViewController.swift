//
//  ArticleTableViewController.swift
//  NewsFun
//
//  Created by Rommel Rico on 5/25/18.
//  Copyright © 2018 Rommel Rico. All rights reserved.
//

import UIKit

class ArticleTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NewsHelper().getArticles()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
