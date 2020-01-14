//
//  ViewController.swift
//  FetchRewardsAssignment
//
//  Created by Strohanov, Yevhen (Chicago) on 1/14/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import UIKit

/*
This will return a json array of items. Using this list of items, display all the items grouped by "listId". Sort the results first by "listId" then by "name" when displaying. Filter our any items where "name" is blank or null. The final result should be displayed to the user in an easy-to-read list.
 */

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var listItems: ListItemsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        Request.fetchData { (items: [ListItem]) in
            self.listItems = ListItemsViewModel(listItems: items)

            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.isHidden = true
            }
        }
    }

}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return listItems?.sections.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems![section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier") as! ItemCell
        cell.label.text = listItems![indexPath.section][indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listItems?.sections[section]
    }
}
