//
//  Article.swift
//  TodaysNews
//
//  Created by Krishna Datt Shukla on 19/01/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import Foundation


struct ArticlesList: Codable {
    let articles: [Article]
}

extension ArticlesList {
    static var all: Resource<ArticlesList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0c7484619bc146abac5b95b928860b7e")!
        return Resource(url: url)
    }()
}

struct Article: Codable {
    let title: String
    let description: String?
}
