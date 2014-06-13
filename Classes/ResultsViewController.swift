//
//  ResultsViewController.swift
//  Words
//
//  Created by Sam Soffes on 6/13/14.
//  Copyright (c) 2014 Nothing Magical Inc. All rights reserved.
//

import UIKit

class ResultsViewController: UITableViewController {
	
	var results: String[] = []

	convenience init() {
		self.init(style: .Plain)
	}
	
    init(style: UITableViewStyle) {
        super.init(style: style)
    }
	
	init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
	
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return countElements(results)
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = results[indexPath.row]
        return cell
    }
}


extension ResultsViewController: UISearchResultsUpdating {
	func updateSearchResultsForSearchController(searchController: UISearchController!) {
		let text = searchController.searchBar.text
		if let result = Thesaurus.defaultThesaurus().resultForQuery(text) {
			results = result.synonyms
		} else {
			results = []
		}
		tableView.reloadData()
	}
}
