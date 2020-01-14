//
//  ItemViewModel.swift
//  FetchRewardsAssignment
//
//  Created by Strohanov, Yevhen (Chicago) on 1/14/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import Foundation

class ListItemsViewModel {
    var items: [String: [ListItem]]
    var sections: [String] {
        items.keys.sorted()
    }
    subscript(index: Int) -> [ListItem] {
        return items[sections[index]]!
    }

    init(listItems: [ListItem]) {
        let result = listItems.filter { (item: ListItem) -> Bool in
            return !(item.name?.isEmpty ?? true)
        }
        print(result)

        items = Dictionary(grouping: result, by: { (item: ListItem) -> String in
            return String(describing: item.listId)
        })
    }
}
