//
//  ListItem.swift
//  FetchRewardsAssignment
//
//  Created by Strohanov, Yevhen (Chicago) on 1/14/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import Foundation

class ListItem: Decodable {
    var id: Int
    var listId: Int
    var name: String?
}
