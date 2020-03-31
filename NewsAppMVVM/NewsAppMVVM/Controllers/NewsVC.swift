//
//  NewsVC.swift
//  TodaysNews
//
//  Created by Krishna Datt Shukla on 18/01/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsVC: UITableViewController {

    let disposeBag = DisposeBag()

    private var articles = [Article]()
    
    private var newsVM: NewsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableView.automaticDimension
        self.navigationController?.navigationBar.prefersLargeTitles = true

        populateNews()
    }
    
    private func populateNews() {
        
        URLRequest.load(resource: ArticlesList.all)
            .subscribe(onNext: { result in
                
                let articles = result.articles
                self.newsVM = NewsViewModel(articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }).disposed(by: disposeBag)
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.newsVM == nil ? 0 : self.newsVM.articlesVM.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "reuseIdentifier")
        
        let articleVM = self.newsVM.articleAt(indexPath.row)
        
        articleVM.title.asDriver(onErrorJustReturn: "")
            .drive((cell.textLabel?.rx.text)!)
            .disposed(by: disposeBag)
        
        articleVM.description.asDriver(onErrorJustReturn: "")
            .drive((cell.detailTextLabel?.rx.text)!)
            .disposed(by: disposeBag)
        
        // Configure the cell...
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0

        return cell
    }
}
