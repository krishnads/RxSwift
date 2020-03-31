//
//  NewsViewModel.swift
//  NewsAppMVVM
//
//  Created by Abhishek Mishra on 01/04/20.
//  Copyright © 2020 InnoIntell. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


struct NewsViewModel {
    let articlesVM: [ArticleViewModel]
    
    init(_ articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
}

extension NewsViewModel {
    
    func articleAt(_ index: Int)  -> ArticleViewModel {
        self.articlesVM[index]
    }
}

struct ArticleViewModel {
    let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
}
