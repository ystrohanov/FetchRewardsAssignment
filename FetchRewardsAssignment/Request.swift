//
//  Request.swift
//  FetchRewardsAssignment
//
//  Created by Strohanov, Yevhen (Chicago) on 1/14/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import Foundation

class Request {

    class func fetchData(_ completionBlock: @escaping ([ListItem]) -> Void) {
        var request = URLRequest(
            url: URL(string: "https://api.jsonbin.io/b/5e0f707f56e18149ebbebf5f")!
        )
        request.setValue("$2b$10$Vr2RAD3mpzFZ6o8bPZNlgOOM0LmFLvN24IoxlELo3arTgNszX7otS", forHTTPHeaderField: "secret-key")
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else { return }

            let listItems = try! JSONDecoder().decode([ListItem].self, from: data)

            completionBlock(listItems)
        }
        task.resume()
    }
}
